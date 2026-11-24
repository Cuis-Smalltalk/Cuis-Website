# Writes packages.yml with the GitHub repositories tagged cuis-smalltalk-package, grouped by package
# name and curated by packages-config.yml.
# Run it from the repository root. GITHUB_TOKEN, when set, raises the GitHub API rate limit.

require "json"
require "net/http"
require "time"
require "yaml"

QUERY = "topic:cuis-smalltalk-package fork:true"
ORGANIZATION = "Cuis-Smalltalk"
PAGE_SIZE = 100
# GitHub search returns an error past its first 1000 results.
MAX_RESULTS = 1000
CONFIG = YAML.load_file("_data/packages-config.yml")
# Activity is the commits of the default branch in the last 12 months, counted per month.
MONTHS = 12
MONTH = 365.0 / MONTHS * 24 * 60 * 60
NOW = Time.now.utc
HEADERS = ENV["GITHUB_TOKEN"] ? { "Authorization" => "Bearer #{ENV["GITHUB_TOKEN"]}" } : {}

def get(url)
  response = Net::HTTP.get_response(URI(url), HEADERS)
  [response, JSON.parse(response.body)]
end

class Repository
  def initialize(data)
    @data = data
  end

  def full_name = @data["full_name"]
  def owner = @data["owner"]["login"]
  def pushed_at = @data["pushed_at"]
  def stars = @data["stargazers_count"]

  # Commits per month, the oldest month first.
  def activity
    @activity ||= commit_dates.each_with_object(Array.new(MONTHS, 0)) do |date, months|
      months[MONTHS - 1 - ((NOW - date) / MONTH).floor.clamp(0, MONTHS - 1)] += 1
    end
  end

  def commit_dates(url = "#{@data["url"]}/commits?" + URI.encode_www_form(since: (NOW - MONTHS * MONTH).iso8601, per_page: 100))
    response, commits = get(url)
    # GitHub answers 409 for a repository without commits.
    return [] if response.code == "409"
    raise "#{full_name}: #{commits["message"]}" unless response.is_a?(Net::HTTPSuccess)
    dates = commits.map { |commit| Time.parse(commit["commit"]["committer"]["date"]) }
    next_page = response["link"].to_s[/<([^>]+)>; rel="next"/, 1]
    next_page ? dates + commit_dates(next_page) : dates
  end

  def package_name
    @data["name"].sub(/\ACuis-(Smalltalk-)?/i, "")
  end

  def description
    description = @data["description"].to_s.strip
    description unless description.empty?
  end

  def excluded?
    CONFIG["excluded"].include?(full_name) || CONFIG["excluded"].include?(owner)
  end

  def official?
    owner == ORGANIZATION
  end

  def featured?
    CONFIG["featured"].include?(full_name)
  end

  def to_h
    {
      "owner" => owner,
      "url" => @data["html_url"],
      "official" => official?,
      "pushed_at" => pushed_at,
      "stars" => stars,
      "commits" => activity.sum,
      "activity" => activity,
      "description" => description,
    }
  end
end

class Package
  # The repositories come most recently pushed first.
  def initialize(repositories)
    @repositories = repositories
  end

  def sources
    official, others = @repositories.partition(&:official?)
    featured, others = others.partition(&:featured?)
    official + featured + others
  end

  def to_h
    {
      "name" => @repositories.first.package_name,
      "featured" => @repositories.any?(&:featured?),
      "official" => @repositories.any?(&:official?),
      "pushed_at" => @repositories.first.pushed_at,
      "stars" => sources.first.stars,
      "commits" => sources.first.activity.sum,
      "activity" => sources.first.activity.dup,
      "sources" => sources.map(&:to_h),
    }
  end
end

def search(page = 1)
  url = URI("https://api.github.com/search/repositories?" + URI.encode_www_form(q: QUERY, sort: "updated", per_page: PAGE_SIZE, page: page))
  _, results = get(url)
  raise "Incomplete search results" if results["incomplete_results"]
  repositories = results["items"].map { |data| Repository.new(data) }
  last_page = repositories.size < PAGE_SIZE || page * PAGE_SIZE == MAX_RESULTS
  last_page ? repositories : repositories + search(page + 1)
end

repositories = search.reject(&:excluded?).sort_by(&:pushed_at).reverse
packages = repositories.group_by { |repository| repository.package_name.downcase }.values.map { |group| Package.new(group) }

File.write("_data/packages.yml", YAML.dump(packages.map(&:to_h), line_width: -1))
