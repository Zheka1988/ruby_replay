class Car
  attr_reader :current_rpm
  attr_accessor :number
  NUMBER_FORMAT = /^[a-yA-Y]{1}\d{3}[a-yA-y]{2}$/i.freeze

  def initialize(number)
    @number = number
    @current_rpm = 0
    validate
  end

  def start_engine
    start_engine! if engine_stopped?
  end

  def eingine_stopped?
    @current_rpm.zero?
  end

  def valid?
    validate!
  rescue StandardError
    false
  end

  protected

  def validate!
    raise "Number can't nil" if number.nil?
    raise 'Number should be at 6 symbols' if number.length < 6
    raise 'Number has invaliid format' if number !~ NUMBER_FORMAT

    true
  end

  attr_writer :current_rpm

  def initial_rpm
    700
  end

  def start_engine!
    self.current_rpm = initial_rpm
  end
end
