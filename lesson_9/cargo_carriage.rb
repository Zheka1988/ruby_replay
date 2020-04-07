class CargoCarriage < Carriage
  def initialize(number, _volume, capacity)
    super(number, 'c', capacity)
  end
end
