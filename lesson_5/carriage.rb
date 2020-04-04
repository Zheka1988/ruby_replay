require_relative 'company'
class Carriage
  include Company
  attr_accessor :number, :type
  def initialize(number, type)
    @number, @type = number, type
  end
end