require_relative 'validation'
require_relative 'instance_counter'
require_relative 'accessors'
class Station
  include InstanceCounter
  include Validation
  extend Accessors
  attr_accessor :trains

  NAME = /\A[а-яa-z0-9]{3,10}\Z/i.freeze
  @@stations = []

  attr_accessor_with_history :name, :fhone_number
  strong_attr_accessor :color, String
  strong_attr_accessor :area, Float

  validate :name, :presence
  validate :name, :format, NAME
  validate :name, :type, String

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
end
