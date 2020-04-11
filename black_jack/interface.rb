class Interface
  attr_accessor :deck, :bank_game, :hand
  attr_reader :stop_game

  ACTION = {
    1 => :hod_dillera, 2 => :take_card, 3 => :open_cards,
    'y' => :new_game, 'n' => :stoped_game
  }.freeze

  def initialize(name)
    @user = User.new(name)
    @hand = Hand.new(@user)
    @diller = Diller.new
    @bank_game = Bank.new
    @stop_game = true
  end

  def start
    @deck = CardDeck.new(@user, @diller)
    @bank_game.accept_bid(10, @user, @diller)
    player_number_cards ? open_cards : action_player while @stop_game
  end

  def action_player
    if @hand.player == @diller
      hod_dillera
    else
      puts show_card_user
      show_action
      i = gets.chomp
      ACTION[i.to_i] ? send(ACTION[i.to_i]) : default
    end
  end

  def show_card_user
    "Vashi karti - #{@user.cards}"
  end

  def new_game
    @user.reset_data
    @diller.reset_data
    @bank_game.reset_data
    @deck = CardDeck.new(@user, @diller)
    @bank_game.accept_bid(10, @user, @diller)
  rescue RuntimeError => e
    puts e.message + " U vas zakonchilis Den'gi!"
    stoped_game
  end

  def stoped_game
    @stop_game = false
  end

  def player_number_cards
    @diller.cards.count == 3 && @user.cards.count == 3 ? true : false
  end

  def default
    puts '=========================================='
    puts 'Выберите znachenie, соответствующее списку!!!'
  end

  def show_action
    puts 'Vvedite chislo dlya vibora deystvia!'
    puts "1. Propustit' hod'"
    puts "2. Vzyt' kartu"
    puts "3. Otkrit' karti"
  end

  def hod_dillera
    puts '=========================================='
    puts "Diller: #{@diller.vzyat_kartu(deck.give_card)}"
    puts '=========================================='
    @hand.next_hod(@user)
  end

  def take_card
    puts '=========================================='
    puts "#{@user.name}, #{@user.vzyat_kartu(deck.give_card)}"
    puts '=========================================='
    @hand.next_hod(@diller)
  end

  def open_cards
    itog_igri
    if @user.point > @diller.point && @user.point <= 21
      puts 'Pozdravlyaem vi vigrali'
      @bank_game.vruchit_viygrish(@user)
    elsif @user.point < @diller.point && @diller.point <= 21
      puts 'Vi proigrali'
      @bank_game.vruchit_viygrish(@diller)
    elsif @diller.point > 21 && @user.point <= 21
      puts 'Pozdravlyaem vi vigrali'
      @bank_game.vruchit_viygrish(@user)
    elsif @diller.point <= 21 && @user.point > 21
      puts 'Vi proigrali'
      @bank_game.vruchit_viygrish(@diller)
    else
      puts "Nich'ya"
      @bank_game.vruchit_viygrish(@diller, @user)
    end
    @hand.next_hod(@user)
    regame
  end

  def itog_igri
    @user.count_point
    @diller.count_point
    puts '================ITOG IGRI================='
    puts "Karti Dillera #{@diller.cards} - point: #{@diller.point}"
    puts "Vashi karti #{@user.cards} - point: #{@user.point}"
    puts '=========================================='
  end

  def regame
    puts "#{@user.name}: Vash cash #{@user.bank}"
    i = ''
    loop do
      show_exit_menu
      i = gets.chomp
      break if %w[y n].include?(i)
    end
    ACTION[i] ? send(ACTION[i]) : default
  end

  def show_exit_menu
    puts "Vi hotite prodolzhit'?"
    puts 'y. Yes'
    puts 'n. No'
  end
end
