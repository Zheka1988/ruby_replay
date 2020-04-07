require_relative 'instance_counter'
class Route
  extend All_objects
  include InstanceCounter
  attr_accessor :stations, :number_route

  def initialize(first_st, last_st, number)
    @stations = [first_st, last_st]
    @number_route = number
    register_instance
  end

  def add_station(station)
    @stations.insert(-2, station)
    show_stations
  end

  def delete_station(station)
    if station != @stations.first && station != @stations.last
      @stations.delete(station)
      show_stations
    else
      puts 'The station can not be removed!!'
    end
  end

  def show_stations
    puts 'Маршрут содержит станции: '
    @stations.each.with_index(1) { |station, index| puts "Station number #{index} - #{station.name}" }
  end

  def change_number_route(number)
    @number_route = number
  end
end

# Класс Route (Маршрут): +
# Имеет начальную и конечную станцию, а также список промежуточных станций.Начальная и конечная станции указываютсся при создании маршрута, а промежуточные могут добавляться между ними.+
# Может добавлять промежуточную станцию в список +
# Может удалять промежуточную станцию из списка +
# Может выводить список всех станций по-порядку от начальной до конечной +
