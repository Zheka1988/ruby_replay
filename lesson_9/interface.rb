class Interface
  NAME_METHOD = {
    1 => :create_stations, 2 => :create_trains,
    3 => :create_routes, 4 => :create_carriages
  }.freeze
  attr_reader :stations, :trains, :routes, :carriages

  def initialize
    @stations = []
    @trains = []
    @routes = []
    @carriages = []
  end

  def create_object
    show_menu
    a = gets.to_i
    NAME_METHOD[a] ? send(NAME_METHOD[a]) : default
  end

  def default
    puts '=========================================='
    puts 'Выберите число, соответствующее списку!!!'
  end

  def add_station(number_route, name_station)
    index = find_route(number_route)
    @routes[index].add_station(find_station(name_station))
  end

  def del_station(number_route, name_station)
    index = find_route(number_route)
    @routes[index].delete_station(find_station(name_station))
  end

  def find_route(number_route)
    @routes.find.with_index(0) do |route, index|
      index if route.number_route == number_route
    end
  end

  def find_station(name_station)
    @stations.find { |st| st if st.name == name_station }
  end

  def station_exist?(name_station)
    @stations.find { |station| station.name == name_station }
  end

  def route_exist?(number)
    @routes.find { |route| route.number_route == number }
  end

  def carriage_exist?(number_carriage)
    @carriages.find { |carriage| carriage.number == number_carriage }
  end

  def train_exist?(number_train)
    @trains.find { |train| train.number == number_train }
  end

  def output_type(type)
    if  type == 'c'
      'грузовой'
    else
      'пасажирский'
    end
  end

  def show_menu
    puts '=========================================='
    puts '1. Создать станцию'
    puts '2. Создать поезд'
    puts '3. Создать маршрут'
    puts '4. Создать вагон'
  end

  def create_stations
    loop do
      puts '=========================================='
      puts 'Введите название станции или пустую строку (просто нажмите Enter), чтобы выйти'
      name_station = gets.chomp
      break if name_station == ''

      if station_exist?(name_station)
        puts 'Станция с таким названием уже существует!'
      else
        @stations << Station.new(name_station)
      end
      @stations.each.with_index(1) do |station, index|
        puts "Cтанция #{index} - \"#{station.name}\""
      end
    end
  rescue StandardError => e
    puts e.message
    retry
  end

  def create_trains
    number_train = ''
    loop do
      puts '=========================================='
      puts 'Введите номер поезда или пустую строку (просто нажмите Enter), чтобы выйти'
      number_train = gets.chomp
      break if number_train == ''

      if train_exist?(number_train)
        puts 'Поезд с таким номером уже существует!'
      else
        add_type_trains(number_train)
      end
      @trains.each.with_index(1) do |train, index|
        puts "Поезд #{index} - #{train.number}, тип поезда - " + output_type(train.type)
      end
    end
  rescue StandardError => e
    puts e.message
    retry
  end

  def create_routes
    loop do
      puts '=========================================='
      puts 'Введите номер маршрута или пустую строку (просто нажмите Enter), чтобы выйти'
      number_route = gets.chomp
      break if number_route == ''

      if route_exist?(number_route)
        puts 'Маршрут с таким номером уже существует!'
        print_routes
      else
        add_name_stations(number_route)
      end
    end
  rescue StandardError => e
    puts e.message
    retry
  end

  def create_carriages
    loop do
      puts '=========================================='
      puts 'Введите номер вагона или пустую строку (просто нажмите Enter), чтобы выйти'
      number_carriage = gets.chomp
      break if number_carriage == ''

      if carriage_exist?(number_carriage)
        puts 'Вагон с таким номером уже существует!'
        print_carriages
      else
        create_type_carriages(number_carriage)
      end
    end
  rescue StandardError => e
    puts e.message
    retry
  end

  def create_type_carriages(number_carriage)
    array_type = [1, 2]
    loop do
      puts 'Выберите тип вагона'
      puts '1. Грузовой'
      puts '2. Пассажирский'
      type = gets.to_i
      break if array_type.include?(type)
    end
    if type == 2
      puts 'Введите количество мест'
      seats = gets.to_i
      @carriages << PassengerCarriage.new(number_carriage, seats)
    else
      puts 'Введите объем вагона'
      volume = gets.to_i
      @carriages << CargoCarriage.new(number_carriage, volume)
    end
    print_carriages
  end

  def print_carriages
    @carriages.each.with_index(1) do |carriage, index|
      print "Вагон #{index} - #{carriage.number}, тип вагона - " + output_type(carriage.type)
      if carriage.type == 'c'
        puts ", объем вагона #{carriage.capacity}."
      else
        puts ", количество мест #{carriage.capacity}."
      end
    end
  end

  def add_name_stations(number_route)
    puts 'Введите название первой станции'
    one_station = gets.chomp
    puts 'Введите название последней станции'
    end_station = gets.chomp
    if !station_exist?(one_station) || !station_exist?(end_station)
      puts 'Убедитесь в существовании введенных станций!'
    else
      @routes << Route.new(
        find_station(one_station),
        find_station(end_station),
        number_route
      )
      print_routes
    end
  end

  def print_routes
    @routes.each.with_index(1) { |route, index| print_route(route, index) }
  end

  def print_route(route, index)
    puts "Маршрут #{index} - #{route.number_route}, " \
         "первая станция \"#{route.stations[0].name}\", " \
         "последняя станция \"#{route.stations[-1].name}\""
  end

  def add_type_trains(number_train)
    array_type = [1, 2]
    loop do
      puts 'Введите 1 - грузовой'
      puts 'Введите 2 - пассажирский'
      type = gets.to_i
      break if array_type.include?(type)
    end
    @trains << if type == 1
                 CargoTrain.new(number_train)
               else
                 PassengerTrain.new(number_train)
               end
  end
end
