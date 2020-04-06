class CargoCarriage < Carriage
  def initialize(number, volume, capacity)
    super(number, 'c', capacity)
  end
end