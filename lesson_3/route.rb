class Route

  attr_accessor :stations
  
  def initialize(first_st, last_st)
    # @stations << first_st << last_st
    @stations = [first_st, last_st]
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    if station != @stations.first && station != @stations.last
      @stations.delete(station)
    else
      puts "The station can not be removed!!"
    end
  end

  def show_list_stations
    @stations.each.with_index(1) { |station, index| puts "#{index}. #{station.name}" }
  end

end





# Класс Route (Маршрут): +
# Имеет начальную и конечную станцию, а также список промежуточных станций.Начальная и конечная станции указываютсся при создании маршрута, а промежуточные могут добавляться между ними.+
# Может добавлять промежуточную станцию в список +
# Может удалять промежуточную станцию из списка +
# Может выводить список всех станций по-порядку от начальной до конечной +