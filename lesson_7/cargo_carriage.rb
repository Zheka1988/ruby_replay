class CargoCarriage < Carriage
  attr_reader :overall_volume, :occupied_volume, :free_volume

  def initialize(number, volume)
    @overall_volume = volume
    @occupied_volume = 0
    @free_volume = volume
    super(number, 'c')
  end

  def load_into_carriage(occupied_volume)
    @occupied_volume += occupied_volume
    @free_volume -= @occupied_volume
  end
end