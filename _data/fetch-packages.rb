# Writes packages.yml with the GitHub repositories tagged cuis-smalltalk-package, grouped by package
# name and curated by packages-config.yml.
# Run it from the repository root. GITHUB_TOKEN, when set, raises the GitHub API rate limit.

require "json"
require "net/http"
require "yaml"

QUERY = "topic:cuis-smalltalk-package fork:true"
ORGANIZATION = "Cuis-Smalltalk"
PAGE_SIZE = 100
# GitHub search returns an error past its first 1000 results.
MAX_RESULTS = 1000
CONFIG = YAML.load_file("_data/packages-config.yml")

class Repository
  def initialize(data)
    @data = data
  end

  def full_name = @data["full_name"]
  def owner = @data["owner"]["login"]
  def pushed_at = @data["pushed_at"]

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
      "sources" => sources.map(&:to_h),
    }
  end
end

def search(page = 1)
  url = URI("https://api.github.com/search/repositories?" + URI.encode_www_form(q: QUERY, sort: "updated", per_page: PAGE_SIZE, page: page))
  headers = ENV["GITHUB_TOKEN"] ? { "Authorization" => "Bearer #{ENV["GITHUB_TOKEN"]}" } : {}
  results = JSON.parse(Net::HTTP.get(url, headers))
  raise "Incomplete search results" if results["incomplete_results"]
  repositories = results["items"].map { |data| Repository.new(data) }
  last_page = repositories.size < PAGE_SIZE || page * PAGE_SIZE == MAX_RESULTS
  last_page ? repositories : repositories + search(page + 1)
end

repositories = search.reject(&:excluded?).sort_by(&:pushed_at).reverse
packages = repositories.group_by { |repository| repository.package_name.downcase }.values.map { |group| Package.new(group) }

File.write("_data/packages.yml", YAML.dump(packages.map(&:to_h), line_width: -1))
