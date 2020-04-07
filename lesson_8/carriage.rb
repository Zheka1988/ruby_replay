require_relative 'manufacturer'
require_relative 'valid'
class Carriage
  include Manufacturer
  include Valid
  attr_accessor :number, :type, :capacity, :occupied_capacity

  NUMBER_FORMAT = /^\d{4}$/.freeze

  def initialize(number, type, capacity)
    @capacity = capacity
    @occupied_capacity = 0
    @array_type = %w[p c]
    @number = number
    @type = type
    validate!
  end

  def take_capacity(num)
    @occupied_capacity += num
    @capacity -= num
  end

  def get_free_capacity
    capacity
  end

  protected

  def validate!
    raise "Вагон может быть пассажирским 'p' или грузовым 'c'" unless @array_type.include?(type) # if type != 'p' && type != 'c' # по логике должно быть или ||
    raise 'Номер вагона состоит из 4 цифр' if number.to_s !~ NUMBER_FORMAT
  end
end
