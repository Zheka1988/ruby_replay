korzina = {}
loop do
  puts "Vvedite nazvanie tovara ili 'stop'!"
  name = gets.chomp
  break if name == 'stop'

  puts 'Vvedite cenu tovara'
  cena = gets.chomp.to_i
  puts 'Vvedite kol-vo priobretennogo tovara'
  kolichestvo = gets.chomp.to_i
  # hash[name] = {price => kolichestvo}
  korzina[name] = { price: cena, quantity: kolichestvo }
end
# puts "Check:"
# hash.each do |name, value|
#   value.each {|cena, kolichestvo| puts "#{name}: #{cena * kolichestvo}"}
# end
# itogo = 0
# hash.each do |name, value|
#   value.each {|cena, kolichestvo| itogo += cena * kolichestvo}
# end

# print "Itogo: #{itogo} \n"
puts '----------------'
puts 'VASH CHECK:'
total_cost = 0
korzina.each.with_index(1) do |(name, hash_value), index|
  price = hash_value[:price] * hash_value[:quantity]
  puts " #{index}. #{name}: #{price}"
  total_cost += price
end

puts "Itogo: #{total_cost}"
