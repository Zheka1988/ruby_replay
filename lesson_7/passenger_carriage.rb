class PassengerCarriage < Carriage
  attr_reader :count_seats, :occupied_seats, :free_seats
  def initialize(number, seats)
    @count_seats = seats
    @free_seats = seats
    @occupied_seats = 0
    super(number, 'p')
  end
  
  def take_place
    @occupied_seats += 1
    @free_seats -= @occupied_seats
  end
end