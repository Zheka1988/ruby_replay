# 3.times do |i|
#   puts i
# end

# 3.times {|i| puts i}
line_num = 0
File.open('./file').each do |line|
  puts "#{line_num += 1}: #{line}"
end
