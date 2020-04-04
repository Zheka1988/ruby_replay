module All_objects  
    @@obj_stations = []
    @@obj_trains = []
  
  def all_stations(stations)
    @@obj_stations = stations
  end

  def get_stations
    puts"#{@@obj_stations}"
  end

  def all_trains(trains)
    @@obj_trains = trains
  end

  def get_trains
    @@obj_trains
  end

end