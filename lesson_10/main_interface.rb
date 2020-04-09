class MainInterface
  def initialize(face)
    @face = face
  end

  def start
    loop do
      puts '==================================================='
      puts '1. Создать станцию, поезд, маршрут или вагон'
      puts '2. Добавить/Удалить станцию в/из маршрут(а)'
      puts '3. Назначить маршрут поезду'
      puts '4. Прицепить/Отцепить вагон к/от поезду(а)'
      puts '5. Переместить поезд по маршруту'
      puts '6. Показать все станции'
      puts '7. Показать все поезда на станции(из прошлых уроков)'
      puts '8. Все поезда (блок)'
      puts '9. Все вагоны поезда (блок)'
      puts '10. Занять место или объем в вагоне'
      puts '11. Количество свободных мест(объема) в вагонах'
      puts '12. Выход'
      a = gets.to_i
      case a
      when 1
        @face.create_object
      when 2
        a = [1, 2]
        puts '==================================================='
        puts 'Введите название станции'
        name_station = gets.chomp
        puts 'Введите номер маршрута'
        number_route = gets.to_i
        if @face.station_exist?(name_station) && @face.route_exist?(number_route)
          loop do
            puts 'Что вы хотите сделать?'
            puts '1. Удалить'
            puts '2. Добавить'
            c = gets.to_i
            break if a.include?(c)
          end
          if a == 1
            @face.del_station(number_route, name_station)
          else
            @face.add_station(number_route, name_station)
          end
        else
          puts 'Убедитесь в существованиии станции и маршрута!'
        end
      when 3
        puts '==================================================='
        puts 'Введите номер маршрута'
        number_route = gets.chomp
        puts 'Введите номер поезда'
        number_train = gets.chomp
        if @face.train_exist?(number_train) && @face.route_exist?(number_route)
          add_route(number_route, number_train)
          @face.trains.each do |tr|
            puts "Поезду присвоен маршрут #{tr.route.number_route}" if tr.number == number_train
          end
        else
          puts 'Убедитесь в существовании поезда и маршрута!'
        end
      when 4
        a = [1, 2]
        puts '==================================================='
        puts 'Введите номер вагона'
        number_carriage = gets.chomp
        puts 'Введите номер поезда'
        number_train = gets.chomp
        if @face.carriage_exist?(number_carriage) && @face.train_exist?(number_train)
          loop do
            puts 'Что вы хотите сделать?'
            puts '1. Прицепить вагон'
            puts '2. Отцепить вагон'
            c = gets.to_i
            break if a.include?(c)
          end
          if a == 1
            carriage_add(number_train, number_carriage)
          else
            carriage_remove(number_train, number_carriage)
          end
        else
          puts 'Убедитесь в существовании вагона и поезда'
        end
      when 5
        array_direction = [1, 2]
        puts '==================================================='
        puts 'Введите номер поезда'
        number_train = gets
        if @face.train_exist?(number_train)
          loop do
            puts 'Куда вы хотите переместить?'
            puts '1. --->'
            puts '2. <---'
            direction = gets.to_i
            break if array_direction.include?(direction)
          end
          if direction == 1
            drive_to_forward(number_train)
          else
            drive_to_back(number_train)
          end
        else
          puts 'Поезда с таким номером не существует!'
        end
      when 6
        puts '==================================================='
        puts 'Маршрут содержит станции: '
        @face.stations.each.with_index(1) do |st, index|
          puts "Станция № #{index} - #{st.name}"
        end
      when 7
        puts '==================================================='
        puts 'Введите название станции'
        name_station = gets.chomp
        if @face.station_exist?(name_station)
          puts "На станции \"#{name_station}\" находятся поезда:"
          @face.stations.each do |st|
            if st.name == name_station
              st.trains.each.with_index(1) { |tr, index| puts "#{index}. Поезд - №#{tr.number}" }
            end
          end
        else
          puts 'Такой станции не существует'
        end
      when 8
        puts 'Введите название станции'
        name_station = gets.chomp
        if @face.station_exist?(name_station)
          @face.stations.each do |st|
            st.all_trains do |tr|
              if st.name == name_station
                puts "Поезд № #{tr.number}, тип = #{tr.type}, " \
                     "количество вагонов #{tr.carriages.length}"
              end
            end
          end
        else
          puts 'Такой станции не существует!'
        end
      when 9
        puts 'Введите номер поезда'
        number_train = gets.chomp
        if @face.train_exist?(number_train)
          @face.trains.each do |tr|
            if tr.number == number_train
              tr.all_carriages { |carri, index| print_info_carriage(carri, index) }
            end
          end
        else
          puts 'Поезда с таким номером не существует'
        end
      when 10
        number_carriage = ''
        ordinal_number = 0
        puts 'Введите номер вагона'
        number_carriage = gets.chomp
        carriage = @face.carriages.find.with_index do |carri, index|
          if carri.number == number_carriage
            ordinal_number = index
            carri
          end
        end
        puts
        raise 'Нет вагона с таким номером!' unless carriage.class < Carriage

        if carriage.type == 'c'
          occupy(ordinal_number)
        else
          buy_seats(ordinal_number)
        end
      when 11
        puts 'Введите номер вагона'
        number_carriage = gets.chomp
        carriage = @face.carriages.find do |carri|
          carri if carri.number == number_carriage
        end
        raise 'Нет вагона с таким номером!' unless carriage.class < Carriage

        if carriage.type == 'c'
          puts "Свободно #{carriage.free_capacity} м3."
        else
          puts "Осталось свободных мест - #{carriage.free_capacity}."
        end
      when 12
        exit
      else
        puts '==================================================='
        puts 'Выберите число, соответствующее списку!!!'
      end
    end
  rescue StandardError => e
    puts e.message
    retry
  end

  def print_info_carriage(carriage, index)
    puts  "#{index}. Номер вагона #{carriage.number}, тип = #{carriage.type}, " \
          "занято #{carriage.occupied_capacity}, свободно #{carriage.free_capacity}"
  end

  def occupy(number)
    puts 'Какой объем занять?'
    volume = gets.to_i
    if @face.carriages[number].free_capacity >= volume
      @face.carriages[number].take_capacity(volume)
      puts "Осталось свободно: #{@face.carriages[number].free_capacity} м3"
      puts "Занято: #{@face.carriages[number].occupied_capacity} м3"
    else
      puts 'Недостаточно свободного места!'
    end
  end

  def buy_seats(number)
    if @face.carriages[number].free_capacity > 0
      @face.carriages[number].take_capacity
      puts "Осталось свободных мест: #{@face.carriages[number].free_capacity}"
      puts "Занято мест: #{@face.carriages[number].occupied_capacity}"
    else
      puts 'Cвободных мест нет!'
    end
  end

  def drive_to_forward(number_train)
    @face.trains.each { |tr| tr.go_next_station if tr.number == number_train }
  end

  def drive_to_back(number_train)
    @face.trains.each { |tr| tr.go_past_station if tr.number == number_train }
  end

  def carriage_add(number_train, number_carriage)
    @face.trains.each do |tr|
      tr.add_carriage(find_carriage(number_carriage)) if tr.number == number_train
    end
  end

  def carriage_remove(number_train, number_carriage)
    @face.trains.each do |tr|
      if tr.number == number_train
        tr.remove_carriage(find_carriage(number_carriage))
      end
    end
  end

  def find_carriage(number_carriage)
    @face.carriages.find { |carri| carri if carri.number == number_carriage }
  end

  def add_route(number_route, number_train)
    @face.trains.each do |tr|
      tr.routes(find_route(number_route)) if tr.number == number_train
    end
  end

  def find_route(number_route)
    @face.routes.find { |rou| rou if rou.number_route == number_route }
  end
end
