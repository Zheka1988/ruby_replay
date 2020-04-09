puts 'Enter string'
str = gets.chomp
puts 'Enter method'
method = gets.chomp.to_sym
puts str.send(method)

class X
  def m
    puts 'Hello'
  end

  # def method_missing(name, *args)
  #   puts "Called method #{name}, with arguments #{args}"
  # end
  def method_missing(name, *_args)
    self.class.send(:define_method, name.to_sym, ->(*args) { puts args.inspect })
  end
end
