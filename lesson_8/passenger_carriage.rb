class PassengerCarriage < Carriage
  def initialize(number, capacity)
    super(number, 'p', capacity)
  end

  def take_capacity
    super(1)
  end
end