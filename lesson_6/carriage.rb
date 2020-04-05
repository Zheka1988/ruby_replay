require_relative 'manufacturer'
class Carriage
  include Manufacturer
  attr_accessor :number, :type
  def initialize(number, type)
    @number, @type = number, type
  end
end