puts 'Kak vas zovut?'
name = gets.chomp
# puts "Kakoy u vas ves?"
# ves = gets.chomp.to_i
puts 'Kakoy u vas rost?'
height = gets.chomp.to_i
ideal_ves = (height - 110) * 1.15

if ideal_ves < 0
  puts 'Vash ves optimalniy!'
else
  puts "#{name}, vash idealniy ves = #{ideal_ves}!!!"
end
