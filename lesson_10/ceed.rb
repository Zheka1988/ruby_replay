class Ceed
  def self.create_stations
    @stations = [Station.new('Astana'), Station.new('Almata'),
                 Station.new('Pavlodar'), Station.new('Aktau')]
  end

  def self.create_trains
    trains = [CargoTrain.new(1), CargoTrain.new(2),
              PassengerTrain.new(11), PassengerTrain.new(22)]
  end

  def self.create_routes
    routes = [Route.new(@stations.first, @stations.last, 123)]
  end

  def self.create_carriages
    carriage = [CargoCarriage.new(11), CargoCarriage.new(22),
                PassengerCarriage.new(111), PassengerCarriage.new(222)]
  end
end
