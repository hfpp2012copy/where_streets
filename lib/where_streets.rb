require "singleton"
require "forwardable"
require "fast_blank"
require "msgpack"

class WhereStreets
  autoload :VERSION, "where_streets/version"

  FILE = MessagePack.unpack(File.read(File.expand_path("../pcas.mp", __dir__))).freeze

  include Singleton

  class << self
    extend Forwardable
    def_delegators :instance, :find_provinces, :find_cities, :find_counties, :find_towns
  end

  def find_provinces
    FILE.keys
  end

  def find_cities(province)
    return [] if province.blank?

    handle_error do
      FILE[province.to_s].keys
    end
  end

  def find_counties(province, city)
    return [] if [province, city].any? { |i| i.blank? }

    handle_error do
      FILE[province.to_s][city.to_s].keys
    end
  end

  def find_towns(province, city, county)
    return [] if [province, city, county].any? { |i| i.blank? }

    handle_error do
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
