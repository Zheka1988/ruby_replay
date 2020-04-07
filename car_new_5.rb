module FuelTank
  def fill_tank(level)
    self.fuel_tank = level
  end

  def fuel_level
    fuel_tank
  end

  protected

  attr_accessor :fuel_tank
end

module Debugger
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end
  module ClassMethods
    def debug(log)
      puts "!!!DEBUG #{log} !!!!"
      # show_work
    end
  end
  module InstanceMethods
    def debug(log)
      self.class.debug(log)
    end

    def print_class
      puts self.class
    end
  end
end

class Car
  include FuelTank
  # extend Debugger
  # extend Debugger::ClassMethods
  # include Debugger::InstanceMethods
  include Debugger
  attr_reader :current_rpm
  @@instances = 0
  # class << self
  #   def description
  #     puts "This is parent class for all car's"
  #   end
  # end
  def self.instances
    @@instances
  end

  # def self.debug(log)
  #   puts "!!!DEBUG #{log} !!!!"
  # end

  debug 'Start interface'

  def initialize
    @@instances += 1
    @current_rpm = 0
    debug 'initialize'
  end

  def show_work
    puts 'WORKed!'
  end

  def start_engine
    start_engine! if engine_stopped?
    # set('rpm', 700) if rpm == 0
  end

  def engine_stopped?
    current_rpm.zero?
  end

  # private
  debug 'End interface'

  protected

  attr_writer :current_rpm
  # INITIAL_RPM = 700
  def initial_rpm
    700
  end

  def start_engine!
    self.current_rpm = INITIAL_RPM
  end
  # ostanovit dvigatel
end

class Truck < Car
  def loading
    puts 'Loaded!'
  end
  # private
  # INITIAL_RPM = 500

  protected

  def initial_rpm
    500
  end
end

class SportCar < Car
  def start_engine
    super
    puts 'Wrooom!'
  end
  # private
  # INITIAL_RPM = 1000

  protected

  def initial_rpm
    1000
  end
end

class Driver
  def drive(car) # Duck Typing - utinnayz tipizaciya
    car.start_engine
  end
end

class MotoBike
  # extend Debugger
  # extend Debugger::ClassMethods
  # include Debugger::InstanceMethods
  # include Debugger
  include FuelTank

  # debug 'MotoBike class'
end
