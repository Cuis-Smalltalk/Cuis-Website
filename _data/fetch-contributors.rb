# Writes contributors.yml with the people who modified Cuis in the last 3, 6 and 12 months, counted by
# the methods they modified, from the change sets in CoreUpdates and PreviousUpdates of Cuis-Smalltalk-Dev.
# Run it from the repository root, with the path of a Cuis-Smalltalk-Dev checkout as argument.

require "date"
require "tmpdir"
require "yaml"

cuis = ARGV[0]

# A method in a change set starts with a line like
#   !Morph methodsFor: 'geometry' stamp: 'jmv 13/May/2026 11:47:14'!
# followed by the line with its selector.
METHOD = /^!(.+) methodsFor: '.*' stamp: '(.*)'.*!\n(.*)/
NAMES = /^knownInitialsAndNames\b(.*?)! !/m
NAME = /#\('(.*?)'\s+'(.*)'\)/

# The date of a stamp is like 13/May/2026 or, in older stamps, like 5/13/2026.
def date_of(stamp)
  date = stamp[%r{\d+/\w+/\d+}]
  Date.strptime(date, date.match?(/[A-Za-z]/) ? "%d/%b/%Y" : "%m/%d/%Y")
end

change_sets = Dir.mktmpdir do |previous_updates|
  Dir.glob("#{cuis}/PreviousUpdates/*.zip").each { |zip| system("unzip", "-q", zip, "-d", previous_updates) }
  files = Dir.glob("#{previous_updates}/**/*.st") + Dir.glob("#{cuis}/CoreUpdates/*.st")
  files.sort_by { |file| File.basename(file).to_i }.map { |file| File.binread(file).force_encoding("UTF-8").scrub }
end

# The names come from the latest change set that defines knownInitialsAndNames.
names = change_sets.filter_map { |source| source[NAMES, 1] }.last.scan(NAME).to_h

# The same version of a method can be in several change sets, and it counts once.
stamps = change_sets.flat_map { |source| source.scan(METHOD) }.uniq.map { |_class, stamp, _selector| stamp }
known = stamps.select { |stamp| names.key?(stamp.split(" ").first) }

periods = [3, 6, 12].map do |months|
  since = Date.today << months
  methods = known.select { |stamp| date_of(stamp) >= since }.map { |stamp| names[stamp.split(" ").first] }.tally
  contributors = methods.sort_by { |name, count| [-count, name] }.map { |name, count| { "name" => name, "methods" => count } }
  { "months" => months, "contributors" => contributors }
end

File.write("_data/contributors.yml", YAML.dump(periods, line_width: -1))
