class Car
  attr_accessor :speed 
  attr_reader :engine_volume, :door_title #:drivers

  def initialize(speed = 0, engine_volume)
    @speed = speed
    @engine_volume = engine_volume
    # @drivers = []
  end

  def change_door_title(driver)
    @door_title = driver.name if driver.cars.include?(self)
  end

  def start_engine
    puts "Wroom!"
  end

  def beep
    puts "Beep Beep!"
  end

  def stop
    self.speed = 0
  end

  def go
    self.speed = 50
    beep
  end

  # def add_driver(driver)
  #   @drivers << driver
  # end

  # def show_drivers
  #   @drivers.each { |driver| puts driver.name }
  # end

  # def speed #getter
  #   @speed
  # end

  # def engine_volume #getter
  #   @engine_volume
  # end

  # def speed=(speed) #setter
  #   @speed = speed
  # end

end