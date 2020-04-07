class Train
  attr_accessor :type, :model, :number, :number_of_wagons

  def initialize(number, type = 'Unknown', model = 'Unknown', number_of_wagons = 0)
    @number = number
    @type = type
    @model = model
    @number_of_wagons = number_of_wagons
  end
end

class Foo
  def bar(key)
    h = { a: 1, b: 2 }
    value = h[key]
    value ||= 0
    # . . . using value
  end

  def long_method
    sleep(3)
  end

  def memoization
    @m ||= long_method
  end
end

class User
  attr_accessor :name

  def has_name?
    !!name
  end

  def has_not_name?
    !has_name?
  end
end

class Color
  def code(name)
    @code = case name
            when :red
              '#f00'
            when :green
              '#0f0'
            when :blue
              '#00f'
            when :white
              '#fff'
            else
              '#000'
    end
  end
end
