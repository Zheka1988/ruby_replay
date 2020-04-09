# class Foo
#   def initialize
#     @bar = "instance var"
#   end

#   private

#   def private_method
#     puts "I'm private methosd"
#   end
# end

# foo = Foo.new
# foo.instance_eval('@bar') # => "instance var"
# foo.instance_eval('private_method')#I'm private methosd

module MyAttrAccessor
  def my_attr_accessor(*names)
    names.each do |name|
      var_name = "@#{name}".to_sym
      define_method(name) { instance_variable_get(var_name) }
      define_method("#{name}=".to_sym) { |value| instance_variable_set(var_name, value) }
    end
  end
end

class Test
  extend MyAttrAccessor

  my_attr_accessor :my_attr, :a, :b, :c
end

# attr_accessor :length, :default => 0
