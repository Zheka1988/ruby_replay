class String
  def self.random(length)
    rand(36**length).to_s(36)
  end

  def my_method
    self.capitalize
  end

  def <<(value) #izmememie standartnix metodov
    "#{self} #{value}"
  end
end