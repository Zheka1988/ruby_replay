class Bank
  attr_reader :summ
  def initialize
    @summ = 0
  end

  def accept_bid(summ, *players)
    players.each do |player|
      player.make_bet(summ)
    end
    @summ = summ * players.count
  end

  def vruchit_viygrish(*players)
    viigrish = @summ / players.count
    players.each do |player|
      player.vzyat_viygrish(viigrish)
    end
  end

  def reset_data
    @summ = 0
  end
end
