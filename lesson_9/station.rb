require_relative 'valid'
require_relative 'instance_counter'
class Station
  include InstanceCounter
  include Valid
  attr_accessor :trains, :name

  NAME_STATION = /\A[а-яa-z0-9]{3,10}\Z/i.freeze
  @@stations = []

  def self.all
    @@stations
  end

  def initialize(name)
    @name = name
    @trains = []
    validate!
    @@stations << self
    register_instance
  end

  def all_trains
    @trains.each { |train| yield(train) }
  end

  def train_arrived(train)
    raise 'Не существует такого поезда!' unless train.class < Train
    raise 'Поезд стоит на этой станции!' if @trains.find do |tr|
      tr if tr.number == train.number
    end

    @trains << train
  rescue StandardError => e
    puts e.message
    false
  end

  def count_by_type(type)
    @trains.count { |train| train.type == type }
  end

  def train_left(train)
    @trains.delete(train)
  end

  protected

  def validate!
    str = 'Название станции включает (а-я,a-z,0-9),
    не зависимо от регистра, кол-во символов от 3 до 10!'
    raise str if name !~ NAME_STATION
  end
end
