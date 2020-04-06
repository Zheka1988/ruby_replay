class PassengerTrain < Train 
  def initialize(number)
    super(number, 'p')
  end
  
  def add_carriage(carriage)
    if carriage.type == @type
      super
    else
      puts "У поезда и вагона разные типы"
    end
  end
end