class Interface
  NAME_METHOD = {
    1 => :create_stations, 2 => :create_trains,
    3 => :reate_routes, 4 => :create_carriages
  }.freeze

  attr_accessor :stations, :trains, :carriages, :routes
  def initialize
    @stations = []
    @trains = []
    @carriages = []
    @routes = []
    # create_ceeds
  end

  def show_menu
    puts '=========================================='
    puts '1. Создать станцию'
    puts '2. Создать поезд'
    puts '3. Создать маршрут'
    puts '4. Создать вагон'
  end

  def create_ceeds
    @stations = Ceed.create_stations
    @trains = Ceed.create_trains
    @carriages = Ceed.create_carriages
    @routes = Ceed.create_routes
    all_stations(@stations)
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

  #------------Create_Station--------------------------------------------
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
      @stations.each.with_index(1) { |station, index| puts "Cтанция #{index} - \"#{station.name}\"" }
    end
  rescue StandardError => e
    puts e.message
    retry
  end

  def station_exist?(name_station)
    @stations.find { |station| station.name == name_station }
  end

  #------------Create_Trains--------------------------------------------
  def create_trains
    loop do
      puts '=========================================='
      puts 'Введите номер поезда или пустую строку (просто нажмите Enter), чтобы выйти'
      number_train = gets.to_i
      if number_train == 0 || train_exist?(number_train)
        break if number_train == 0

        puts 'Поезд с таким номером уже существует!'
      else
        begin
          puts 'Введите 1 - грузовой'
          puts 'Введите 2 - пассажирский'
          b = gets.to_i
        end until b == 1 || b == 2
        @trains << if b == 1
                     CargoTrain.new(number_train)
                   else
                     PassengerTrain.new(number_train)
                   end
      end
      @trains.each.with_index(1) { |train, index| puts "Поезд #{index} - #{train.number}, тип поезда - " + output_type(train.type) }
    end
  rescue StandardError => e
    puts e.message
    retry
  end

  def train_exist?(number_train)
    @trains.find { |train| train.number == number_train }
  end

  def output_type(type)
    if type == 'C'
      'грузовой'
    else
      'пасажирский'
    end
  end

  #------------Create_Route--------------------------------------------
  def create_routes
    loop do
      puts '=========================================='
      puts 'Введите номер маршрута или пустую строку (просто нажмите Enter), чтобы выйти'
      number_route = gets.to_i
      if number_route == 0 || route_exist?(number_route)
        break if number_route == 0

        puts 'Маршрут с таким номером уже существует!'
        @routes.each.with_index(1) do |route, index|
          puts "Маршрут #{index} - #{route.number_route}, первая станция \"#{route.stations[0].name}\", последняя станция \"#{route.stations[-1].name}\""
        end
      else
        puts 'Введите название первой станции'
        one_station = gets.chomp
        puts 'Введите название последней станции'
        end_station = gets.chomp
        if !station_exist?(one_station) || !station_exist?(end_station)
          puts 'Убедитесь в существовании введенных станций!'
        else
          @routes << Route.new(@stations.find { |st| st.name == one_station }, @stations.find { |st| st.name == end_station }, number_route)
          @routes.each.with_index(1) do |route, index|
            puts "Маршрут #{index} - #{route.number_route}, первая станция \"#{route.stations[0].name}\", последняя станция \"#{route.stations[-1].name}\""
          end
        end
      end
    end
  rescue StandardError => e
    puts e.message
    retry
  end

  def route_exist?(number)
    @routes.find { |route| route.number_route == number }
  end

  #------------Create_Carriage--------------------------------------------
  def create_carriages
    loop do
      puts '=========================================='
      puts 'Введите номер вагона или пустую строку (просто нажмите Enter), чтобы выйти'
      number_carriage = gets.to_i
      if number_carriage == 0 || carriage_exist?(number_carriage)
        break if number_carriage == 0

        puts 'Вагон с таким номером уже существует!'
        @carriages.each.with_index(1) { |carriage, index| puts "Вагон #{index} - #{carriage.number}, находится на станции \"#{carriage.station.name}\", тип вагона - " + output_type(carriage.type) }
      else
        begin
          puts 'Выберите тип вагона'
          puts '1. Грузовой'
          puts '2. Пассажирский'
          a = gets.to_i
        end until a == 1 || a == 2
        if a == 2
          puts 'Введите количество мест'
          seats = gets.to_i
          @carriages << PassengerCarriage.new(number_carriage, seats)
        else
          puts 'Введите объем вагона'
          volume = gets.to_i
          @carriages << CargoCarriage.new(number_carriage, volume)
        end
        @carriages.each.with_index(1) do |carriage, index|
          print "Вагон #{index} - #{carriage.number}, тип вагона - " + output_type(carriage.type)
          if carriage.type == 'c'
            puts ", объем вагона #{carriage.overall_volume}."
          else
            puts ", количество мест #{carriage.count_seats}."
          end
        end
      end
    end
  rescue StandardError => e
    puts e.message
    retry
  end

  def carriage_exist?(number_carriage)
    @carriages.find { |carriage| carriage.number == number_carriage }
  end

  #------------Add and Delete stations in Route----------------------------
  def add_station(number_route, name_station)
    @routes.each do |route|
      route.add_station(@stations.find { |st| st.name == name_station }) if route.number_route == number_route
    end
  end

  def del_station(number_route, name_station)
    @routes.each do |route|
      route.delete_station(@stations.find { |st| st.name == name_station }) if route.number_route == number_route
    end
  end
end
