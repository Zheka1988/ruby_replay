class Hand
  attr_accessor :player

  def initialize(player)
    next_hod(player)
  end

  def next_hod(player)
    @player = player
  end
end
