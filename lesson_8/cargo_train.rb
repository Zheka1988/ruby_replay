class CargoTrain < Train
  def initialize(number)
    super(number, 'c')
  end

  def add_carriage(carriage)
    if validate?(carriage)
      super
    else
      puts "У поезда и вагона разные типы"
    end
  end

end