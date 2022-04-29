require "json"
require "singleton"
require "forwardable"
require "fast_blank"

class WhereStreets
  autoload :VERSION, "where_streets/version"

  FILE = JSON.parse(File.read(File.expand_path("../pcas.json", __dir__))).freeze

  include Singleton

  class << self
    extend Forwardable
    def_delegators :instance, :find_provinces, :find_cities, :find_counties, :find_towns
  end

  def find_provinces
    FILE.keys
  end

  def find_cities(province)
    handle_error do
      return [] if province.blank?

      FILE[province.to_s].keys
    end
  end

  def find_counties(province, city)
    handle_error do
      return [] if province.blank? || city.blank?

      FILE[province.to_s][city.to_s].keys
    end
  end

  def find_towns(province, city, county)
    handle_error do
      return [] if province.blank? || city.blank? || county.blank?

      FILE[province.to_s][city.to_s][county.to_s]
    end
  end

  private

  def handle_error
    yield
  rescue StandardError => e
    puts e.inspect
    puts e.backtrace
    []
  end
end
