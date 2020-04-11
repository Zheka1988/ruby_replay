class User < Player
  def initialize(name)
    super(name)
  end

  def vzyat_kartu(card)
    if @cards.count >= 3
      'U vas 3 karti'
    else
      add_card(card)
      'Vi vzyaly kartu'
    end
  end
end
