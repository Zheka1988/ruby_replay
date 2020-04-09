require_relative 'instance_counter'
require_relative 'validation'
require_relative 'accessors'
class Route
  include Validation
  extend Accessors
  include InstanceCounter
  attr_accessor :stations

  NUMBER_FORMAT = /^\d{4}$/.freeze

  attr_accessor_with_history :number_route
  strong_attr_accessor :extension, Float

  validate :number_route, :presence
  validate :number_route, :format, NUMBER_FORMAT
  validate :number_route, :type, String

  def initialize(first_st, last_st, number)
    @stations = [first_st, last_st]
    @number_route = number
    validate!
    register_instance
  end

  def add_station(station)
    str = 'Нет существует такой станции или она уже включена в маршрут!'
    raise str if station.class != Station || @stations.find do |stat|
      stat.name == station.name
    end
    raise 'Данная станция включена в маршрут' if @stations.find do |stat|
      stat == station
    end

    @stations.insert(-2, station)
  rescue StandardError => e
    puts e.message
  end

  def delete_station(station)
    if station != @stations.first && station != @stations.last
      @stations.delete(station)
      show_stations
    else
      puts 'Эта станция не может быть удалена!'
    end
  end

  def show_stations
    @stations.each.with_index(1) do |station, index|
      puts "Station number #{index} - #{station.name}"
    end
  end

  def change_number_route(number)
    spare_number = @number_route
    @number_route = number
    if valid?
      puts "Номер изменен на #{number}"
    else
      @number_route = spare_number
    end
  end
end
