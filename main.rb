# begin
#   puts "Before Exception"
#   # 1/0
#   Math.sqrt(-1)
# # rescue
# # puts "You can't do that!"
# # rescue Exception => e
# #   puts "Exception: #{e.inspect}"
#   # puts e.backtrace#.inspect - 
# rescue StandardError => e  #-otrabotaet
#   # puts "Exception: #{e.inspect}"
#   puts "Error!!!"
#   raise
# rescue NoMemoryError => e # ne otrabotaet
#   # puts "Exception: #{e.inspect}"
#   puts "No memory!!!"
# end
# puts "After Exception"
#---------------------------------------

# def method_with_error
#   #......
#   # raise "Oh no!!!"
#   raise ArgumentError, "Oh no!!!"
# end

# begin
#   method_with_error
# # rescue RuntimeError => e
#   rescue ArgumentError => e
#   puts e.inspect
# end

# puts "After exception"

#----------------------------------------

# def sqrt(value)
#   sqrt = Math.sqrt(value)
#   puts sqrt
# rescue StandardError
#   puts "Nevernoe znachenie"
# end

# sqrt(-1)

def connect_to_wikipedia
  #----------
  raise "Connection error"
end

attempt = 0
begin
  connect_to_wikipedia
  # puts "There was #{attempt} attempts"
rescue NoMemoryError#RuntimeError
  attempt += 1
  # retry if attempt < 3
  # puts "Check your internet connection"
  retry if attempt < 3
  # puts "There was #{attempt} attempts"
ensure
  puts "There was #{attempt} attempts"
end
