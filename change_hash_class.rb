# class Hash

#   def method_missing(name)
#     # if self.keys.any? { |key| key == name.to_s || key == name.to_sym}
#     #   if self.keys.include? name.to_s
#     #     self[name.to_s]
#     #   else
#     #     self[name.to_sym]
#     #   end
#     # else
#     #   raise NoMethodError
#     # end
#     self[name.to_sym] || self[name.to_s] || super
#   end

# end

class Array
  def foldl(method)
    inject do |result, i|
      puts "#{result} ---- #{i}"
      if result
        result.send(method, i)
      else
        i
      end
    end
  end
end

# puts [1000.0, 200.0, 50.0].foldl("/")
