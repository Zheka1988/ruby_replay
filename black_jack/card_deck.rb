class CardDeck
  attr_reader :game_deck

  CARD_VALUE = {
    'T+' => 11, 'T<3' => 11, 'T^' => 11, 'T<>' => 11,
    'K+' => 10, 'K<3' => 10, 'K^' => 10, 'K<>' => 10,
    'D+' => 10, 'D<3' => 10, 'D^' => 10, 'D<>' => 10,
    'V+' => 10, 'V<3' => 10, 'V^' => 10, 'V<>' => 10,
    '10+' => 10, '10<3' => 10, '10^' => 10, '10<>' => 10,
    '9+' => 9, '9<3' => 9, '9^' => 9, '9<>' => 9,
    '8+' => 8, '8<3' => 8, '8^' => 8, '8<>' => 8,
    '7+' => 7, '7<3' => 7, '7^' => 7, '7<>' => 7,
    '6+' => 6, '6<3' => 6, '6^' => 6, '6<>' => 6,
    '5+' => 5, '5<3' => 5, '5^' => 5, '5<>' => 5,
    '4+' => 4, '4<3' => 4, '4^' => 4, '4<>' => 4,
    '3+' => 3, '3<3' => 3, '3^' => 3, '3<>' => 3,
    '2+' => 2, '2<3' => 2, '2^' => 2, '2<>' => 2
  }.freeze

  def initialize(*players)
    @game_deck = CARD_VALUE.keys
    shuffle_deck
    deal_cards(players)
  end

  def deal_cards(players)
    players.each do |player|
      2.times { player.add_card(give_card) }
    end
  end

  def shuffle_deck
    @game_deck.shuffle!
  end

  def give_card
    card = @game_deck.pop
    [card, CARD_VALUE[card]]
  end
end
