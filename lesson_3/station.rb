class Station
  attr_accessor :trains, :name #:count_gruz_train, :count_pass_tarin

  def initialize(name)
    @name = name
    @trains = []
    # @count_gruz_train = 0
    # @count_pass_tarin = 0
  end

  def train_arrived(train)
    @trains << train
    # if train.type == "gruz"
    #   self.count_gruz_train += 1
    # else 
    #   self.count_pass_tarin += 1
    # end
  end

  def count_by_type(type)
    @trains.count { |train|  train.type == type }
  end

  def train_left(train)
    @trains.delete(train)
    puts "Поезд с номером #{train.number} уехал!!"
  end

end


# Имеет название, которое указывается при ее создании +
# Может принимать поезда (по одному за раз) +
# Может возвращать список всех поездов на станции, находящиеся в текущий момент +
# Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских +
# Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции). +