class Diller < Player
  def initialize
    super('Diller')
  end

  def vzyat_kartu(card)
    if @point >= 17 || @cards.count >= 3
      'Dostatocno'
    else
      add_card(card)
      'Vzyal odnu karu'
    end
  end
end
