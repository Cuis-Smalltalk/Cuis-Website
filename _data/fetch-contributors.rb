# Writes contributors.yml with the people who modified Cuis in the last 3, 6 and 12 months, counted by
# the methods they modified, from the change sets in CoreUpdates and PreviousUpdates of Cuis-Smalltalk-Dev
# and from every version of its packages committed in the last 12 months.
# Run it from the repository root, with the path of a Cuis-Smalltalk-Dev clone with its history as argument.

require "date"
require "open3"
require "stringio"
require "tmpdir"
require "yaml"

MONTHS = [3, 6, 12]

# Who modified a method and when, like 'jmv 13/May/2026 11:47:14'.
Stamp = Data.define(:text) do
  def initials
    text.split(" ").first
  end

  # The date is like 13/May/2026 or, in older stamps, like 5/13/2026. Some stamps have no date.
  def made_since?(day)
    text.scan(%r{\d+/\w+/\d+}).any? do |date|
      Date.strptime(date, date.match?(/[A-Za-z]/) ? "%d/%b/%Y" : "%m/%d/%Y") >= day
    end
  end
end

# A method in a change set or a package starts with a line like
#   !Morph methodsFor: 'geometry' stamp: 'jmv 13/May/2026 11:47:14'!
# followed by the line with its selector.
MethodVersion = Data.define(:class_name, :selector, :stamp) do
  class << self
    def all_in(source)
      source
        .scan(/^!(.+) methodsFor: '.*' stamp: '(.*)'.*!\n(.*)/)
        .map { |class_name, stamp, selector| new(class_name, selector, Stamp.new(stamp)) }
    end
  end

  # A class that is renamed or copied keeps the stamps of its methods: they are not new modifications.
  def modification
    [selector, stamp]
  end

  def initials
    stamp.initials
  end

  def made_since?(day)
    stamp.made_since?(day)
  end
end

# The people who modify Cuis, known by the initials of their stamps.
class Authors
  def initialize(names)
    @names = names
  end

  def contributions_in(method_versions)
    method_versions
      .filter_map { |version| @names[version.initials] }
      .tally
  end
end

# The change sets of Cuis in the order they were applied: the old ones, zipped in PreviousUpdates, and the
# recent ones, in CoreUpdates.
class ChangeSets
  class << self
    def in(cuis)
      sources = Dir.mktmpdir do |previous_updates|
        Dir.glob("#{cuis}/PreviousUpdates/*.zip").each { |zip| system("unzip", "-q", zip, "-d", previous_updates) }
        files = Dir.glob("#{previous_updates}/**/*.st") + Dir.glob("#{cuis}/CoreUpdates/*.st")
        files
          .sort_by { |file| File.basename(file).to_i }
          .map { |file| File.binread(file).force_encoding("UTF-8").scrub }
      end
      new(sources)
    end
  end

  def initialize(sources)
    @sources = sources
  end

  # The same version of a method can be in several change sets, and it counts once.
  def method_versions
    @sources
      .flat_map { |source| MethodVersion.all_in(source) }
      .uniq
  end

  # The names come from the latest change set that defines knownInitialsAndNames.
  def authors
    names = @sources
      .filter_map { |source| source[/^knownInitialsAndNames\b(.*?)! !/m, 1] }
      .last
    Authors.new(names.scan(/#\('(.*?)'\s+'(.*)'\)/).to_h)
  end
end

# A clone of Cuis-Smalltalk-Dev, with the history of its commits.
class Clone
  class << self
    def at(path)
      clone = new(path)
      abort "#{path} is a shallow clone, and the history of its packages is needed" if clone.shallow?
      clone
    end
  end

  def initialize(path)
    @path = path
  end

  def shallow?
    git("rev-parse", "--is-shallow-repository") == "true\n"
  end

  # The files of some paths as each commit since a day left them, oldest commit first. The commits of
  # merged branches count too.
  def versions_committed_since(day, paths)
    commits = blobs_committed_since(day, paths)
    blobs = commits.flatten.uniq
    download(blobs)
    contents = contents_of(blobs)
    commits.map { |commit| contents.values_at(*commit) }
  end

  private

  # Each file that a commit changed is in a line like
  #   :100644 100644 1f0e3a… 8c2d41… M	Packages/Features/JSON.pck.st
  # with its blob before and after the commit.
  def blobs_committed_since(day, paths)
    git("log", "--reverse", "--full-history", "-m", "--diff-filter=d", "--since=#{day}", "--format=format:commit",
        "--raw", "--no-abbrev", "--", *paths)
      .split(/^commit$/)
      .map { |commit| commit.scan(/^:\d+ \d+ \h+ (\h+)/).flatten }
      .reject(&:empty?)
  end

  # A clone without blobs, like the one of the Pages workflow, downloads the versions in one fetch, so that
  # reading them doesn't download each in a request of its own.
  def download(blobs)
    promisor_remotes.each do |remote|
      git("-c", "fetch.negotiationAlgorithm=noop", "fetch", "--quiet", remote, "--no-tags", "--no-write-fetch-head",
          "--recurse-submodules=no", "--filter=blob:none", "--stdin", input: blobs.join("\n"))
    end
  end

  def promisor_remotes
    git("remote")
      .split
      .select { |remote| promisor?(remote) }
  end

  def promisor?(remote)
    git("config", "--type=bool", "--default=false", "--get", "remote.#{remote}.promisor") == "true\n"
  end

  # All the blobs are read with a single git, which answers each one with a line like
  #   8c2d41… blob 81234
  # followed by its content and a newline.
  def contents_of(blobs)
    output = StringIO.new(git("cat-file", "--batch", input: blobs.join("\n")))
    blobs.to_h do |blob|
      size = output.gets.split.last.to_i
      [blob, output.read(size + 1).force_encoding("UTF-8").scrub]
    end
  end

  def git(*arguments, input: nil)
    output, status = Open3.capture2("git", "-C", @path, *arguments, stdin_data: input, binmode: true)
    abort "git #{arguments.join(" ")} failed" unless status.success?
    output
  end
end

# The versions of the packages committed since a day, commit by commit. The last commit only has the last
# version of each method, and a method that several people modified counts for each of them.
class PackageHistory
  PACKAGES = ["Packages/*.pck.st", "CompatibilityPackages/*.pck.st"]

  class << self
    def in(clone, since:)
      new(clone.versions_committed_since(since, PACKAGES))
    end
  end

  def initialize(commits)
    @commits = commits
  end

  # A version of a method counts the first time it shows up: it shows up again in the next commits while
  # nobody modifies it, and in a class that is renamed or copied.
  def method_versions
    seen = Set.new
    @commits.flat_map do |sources|
      versions = sources
        .flat_map { |source| MethodVersion.all_in(source) }
        .uniq
      first_seen = versions.reject { |version| seen.include?(version.modification) }
      seen.merge(versions.map(&:modification))
      first_seen
    end
  end
end

cuis = ARGV[0]
clone = Clone.at(cuis)
change_sets = ChangeSets.in(cuis)
# The history starts a month before the longest period so that no commit made the day of a stamp is missed:
# the stamps decide the periods.
package_history = PackageHistory.in(clone, since: Date.today << (MONTHS.max + 1))
method_versions = change_sets.method_versions | package_history.method_versions
authors = change_sets.authors

periods = MONTHS.map do |months|
  since = Date.today << months
  contributions = authors.contributions_in(method_versions.select { |version| version.made_since?(since) })
  contributors = contributions
    .sort_by { |name, count| [-count, name] }
    .map { |name, count| { "name" => name, "methods" => count } }
  { "months" => months, "contributors" => contributors }
end

File.write("_data/contributors.yml", YAML.dump(periods, line_width: -1))
