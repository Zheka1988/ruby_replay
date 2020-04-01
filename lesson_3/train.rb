class Train
  attr_reader :past_station, :next_station, :current_station, :type, :speed, :number, :count_railway_carriage, :route

  def initialize (number, type, count_railway_carriage)
    @number = number
    @type = type
    @count_railway_carriage = count_railway_carriage
    @speed = 0
  end

  def up_speed(speed)
    @speed += speed
  end

  def down_speed(speed)
    @speed -= speed
    @speed = 0 if @speed < 0
  end

  def add_railway_carriage
    if @speed == 0
      @count_railway_carriage += 1
    else
      puts "Train in the way!, speed = #{@speed}"
    end
  end

  def routes(route)
    @route = route
    @route.stations[0].train_arrived(self)
    @position_station = 0
  end

  def go_next_station
    if current_station == @route.stations[-1]
      puts "Мы на последней станции #{current_station.name}"
    else
      current_station.train_left(self)
      @position_station += 1
      current_station.train_arrived(self)
    end
  end

  def go_past_station
    if current_station == @route.stations[0]
      puts "Мы на первой станции #{current_station.name}"
    else
      current_station.train_left(self)
      @position_station -= 1
      current_station.train_arrived(self)
    end    
  end

  def next_station
    @route.stations[@position_station + 1] if current_station != @route.stations[-1]
  end

  def past_station
    @route.stations[@position_station - 1] if current_station != @route.stations[0]
  end

  def current_station
    @route.stations[@position_station]
  end

end


# Класс Train (Поезд): +
# Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов, эти данные указываются при создании экземпляра класса +
# Может набирать скорость +
# Может возвращать текущую скорость +
# Может тормозить (сбрасывать скорость до нуля) +
# Может возвращать количество вагонов +
# Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или уменьшает количество вагонов). Прицепка/отцепка вагонов может осуществляться только если поезд не движется. +
# Может принимать маршрут следования (объект класса Route). +
# При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.+
# Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад, но только на 1 станцию за раз. +
# Возвращать предыдущую станцию, текущую, следующую, на основе маршрута +
