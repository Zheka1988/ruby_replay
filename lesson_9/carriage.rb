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
  end

  def free_capacity
    @capacity - @occupied_capacity
  end

  protected

  def validate!
    str1 = "Вагон может быть пассажирским 'p' или грузовым 'c'"
    raise  str1 unless @array_type.include?(type)
    raise 'Номер вагона состоит из 4 цифр' if number.to_s !~ NUMBER_FORMAT
  end
end
