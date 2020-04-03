class Car
  attr_reader :current_rpm
  def initialize
    @current_rpm  = 0
  end
  def start_engine
    start_engine! if engine_stopped?
    # set('rpm', 700) if rpm == 0
  end
  
  def engine_stopped?
    current_rpm.zero?
  end

  # private
  protected
  attr_writer :current_rpm
  # INITIAL_RPM = 700
  def initial_rpm
    700
  end
  def start_engine!
    self.current_rpm = INITIAL_RPM
  end
  #ostanovit dvigatel

end

class Truck < Car
  def loading
    puts "Loaded!"
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
    puts "Wrooom!"
  end
  # private
  # INITIAL_RPM = 1000
  protected
  def initial_rpm
    1000
  end
end

class Driver
  def drive(car) #Duck Typing - utinnayz tipizaciya 
    car.start_engine
  end
end

