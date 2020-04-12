require_relative 'validation'
class Player
  include Validation
  attr_accessor :name, :point, :cards, :tuz
  attr_reader :bank
  NAME = /^[a-z]{3,6}$/i.freeze

  def initialize(name)
    self.class.validate_name
    @name = name
    @bank = 100
    @cards = []
    @point = 0
    @tuz = 0
    validate!
  end

  def reset_data
    @cards.clear
    @point = 0
    @tuz = 0
  end

  def add_card(card)
    @tuz += 1 if card[0].include?('T')
    @cards << card[0]
    @point += card[1]
  end

  def make_bet(summ)
    raise @name.to_s if @bank <= 0 && @bank < summ

    sub_cash(summ)
  end

  def vzyat_viygrish(summ)
    add_cash(summ)
  end

  def count_point
    @tuz.times do
      break if @point <= 21

      @point -= 10
    end
  end

  def self.validate_name
    validate :name, :presence
    validate :name, :format, NAME
    validate :name, :type, String
  end

  protected

  def sub_cash(summ)
    @bank -= summ
  end

  def add_cash(summ)
    @bank += summ
  end
end
