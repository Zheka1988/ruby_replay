require_relative 'manufacturer'
require_relative 'valid'
class Carriage
  include Manufacturer
  include Valid
  attr_accessor :number, :type
  
  NUMBER_FORMAT = /^\d{4}$/
  
  def initialize(number, type)
    @array_type = ['p', 'c']    
    @number, @type = number, type
    validate!
  end

  protected
  def validate!
    raise "Вагон может быть пассажирским 'p' или грузовым 'c'" if !@array_type.include?(type) #if type != 'p' && type != 'c' # по логике должно быть или ||
    raise "Номер вагона состоит из 4 цифр" if number.to_s !~ NUMBER_FORMAT
  end
end