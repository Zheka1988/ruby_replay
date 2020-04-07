require_relative 'all_objects'
require_relative 'instance_counter'
class Station
  extend All_objects
  include InstanceCounter
  attr_accessor :trains, :name
  def initialize(name)
    @name = name
    @trains = []
    register_instance
    self.class.instances
  end

  def train_arrived(train)
    @trains << train
    puts "Текущая станция #{@name}"
  end

  def count_by_type(type)
    @trains.count { |train| train.type == type }
  end

  def train_left(train)
    @trains.delete(train)
    puts "Поезд с номером #{train.number} уехал!!"
  end

  def self.all
    get_stations
  end
end

# Имеет название, которое указывается при ее создании +
# Может принимать поезда (по одному за раз) +
# Может возвращать список всех поездов на станции, находящиеся в текущий момент +
# Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских +
# Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции). +
