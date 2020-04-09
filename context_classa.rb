# puts "hi1 from #{self.inspect}"
# class Abc
#   puts "hi2 from #{self.inspect}"
#   def hi
#     puts "hi3 from #{self.inspect}"
#   end
# end

# Abc.new.hi

# hi1 from main
# hi2 from Abc
# hi3 from #<Abc:0x005606241f8b70>
#----------------------------------------------
# def attr_accessor(*methods)
#   methods.each do |method|
#     eval %{
#     class #{self}
#       def #{method}
#         @#{method}
#         Dir.chdir("/etc/")
#         f = File.open("passwd")
#         f.each { |str| puts str}
#       end
#       def #{method}=(v)
#         @#{method} = v
#       end
#     end
#     }
#   end
# end

# s = "Class"
# s.instance_eval{attr_accessor :pas}
# Any_Class.pas (Array, String .....)
#------------------------------------------------
class Module
  def attr_accessor(*methods)
    options = methods.last.is_a?(Hash) ? methods.pop : {}
    methods.each do |method|
      class_eval %{
        def #{method}
          \# не пишите так никогда!
          @#{method} #{"||= #{options[:default]}" if options[:default]}
        end
        def #{method}=(v)
          @#{method} = v
        end
      }
    end
  end
end
class Song
  attr_accessor :length, default: 42
  attr_accessor :title, default: 'title'
end

puts Song.new.length
puts Song.new.title
