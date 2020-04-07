require_relative 'instance_counter'
require_relative 'valid'
class Route
  include Valid
  include InstanceCounter
  attr_accessor :stations, :number_route

  NUMBER_FORMAT = /^\d{4}$/.freeze

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

  protected

  def validate!
    raise 'Станции не могут быть одинаковыми' if @stations[0] == @stations[1]
    raise 'Номер маршрута состоит из 4 цифр' if number_route.to_s !~ NUMBER_FORMAT
  end
end
