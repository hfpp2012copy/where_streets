require "json"
require "fast_blank"

module WhereStreets
  autoload :VERSION, "where_streets/version"

  FILE = JSON.parse(File.read(File.expand_path("../pcas.json", __dir__))).freeze

  module_function

  def find_provinces
    FILE.keys
  end

  def find_cities(province)
    return [] if province.blank?

    FILE[province.to_s].keys
  rescue StandardError => e
    puts e.inspect
    puts e.backtrace
    []
  end

  def find_counties(province, city)
    return [] if province.blank? || city.blank?

    FILE[province.to_s][city.to_s].keys
  rescue StandardError => e
    puts e.inspect
    puts e.backtrace
    []
  end

  def find_towns(province, city, county)
    return [] if province.blank? || city.blank? || county.blank?

    FILE[province.to_s][city.to_s][county.to_s]
  rescue StandardError => e
    puts e.inspect
    puts e.backtrace
    []
  end
end
