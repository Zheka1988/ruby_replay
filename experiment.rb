class Expire
  @@value_class = 'value class'
  def initialize
    @value_instance = 'value_instance'
  end

  def method_instance
    puts 'method_instance'
    other_method_instance
  end

  def other_method_instance
    puts 'other_method_instance'
    puts "value_instance: #{@value_instance}"
    self.class.method_class # v "chistom vide" net dostupa
    puts "value_class: #{@@value_class} - from other_method_instance"
  end

  def self.method_class
    puts 'method_class'
    other_method_class
    # method_instance #ne imeet dostuma
    # puts "value_instance: #{@value_instance}" # ne imeet dostupe
  end

  def self.other_method_class
    puts 'other_method_class'
    puts "value_class: #{@@value_class}"
  end
end
