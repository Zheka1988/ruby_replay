require_relative 'instance_counter'
class Station
  include InstanceCounter
  attr_accessor :trains, :name 
  @@stations = []
  
  def self.all
    get_stations
  end
  
  def initialize(name)
    @name = name
    @trains = []
    @@stations << self
    register_instance
  end

  def train_arrived(train)
    @trains << train
    puts "Текущая станция #{@name}"
  end

  def count_by_type(type)
    @trains.count { |train|  train.type == type }
  end

  def train_left(train)
    @trains.delete(train)
    puts "Поезд с номером #{train.number} уехал!!"
  end

end
