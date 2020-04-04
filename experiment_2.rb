# @@sides - peremennaya class
require_relative 'ClassLevelInheritableAttributes.rb'
class Polygon
  include ClassLevelInheritableAttributes
  # @@sides = 10
  # class << self; attr_accessor :sides end
  inheritable_attributes :sides, :b1
  @sides = 8
  @b1 = 'bb11'
  # def self.sides
  #   # @@sides
  #   @sides
  # end

  def sides #pri obrashenii k etomu metodu? vozvrat = nil
    @sides  # t.k. peremennaya instans LEVEL-CLASS
  end
end

# pol = Polygon.new
# # puts pol.sides # ne dostupna peremennaya instans LEVEL-CLASS
# puts Polygon.sides
# p 

# # puts pol.m1("ZHeka and Diana")
# puts Polygon.m1("Zheka")
# puts Polygon.arg("Zheka")

class Triangle < Polygon
  # @@sides = 3
  @sides = 3
end

class Rectangle < Polygon
  # @@sides = 4
  @sides = 4
  @b1 = "b1"
end

class Tria < Triangle

end

# Polygon.inheritable_attributes(:m1)

# puts Polygon.sides
# puts Triangle.sides
# puts Rectangle.sides

