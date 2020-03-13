puts "Vvedite storony treugol'nika!"
puts "a?"
a = gets.chomp.to_i
puts "b?"
b = gets.chomp.to_i
puts "c?"
c = gets.chomp.to_i

d = b**2 - 4 * a * c

if d > 0
	x1 = (-b + Math.sqrt(d)) / (2 * a)
	x2 = (-b - Math.sqrt(d)) / (2 * a)
	puts "diskriminant = #{d}, x1 = #{x1}, x2 = #{x2}"
elsif d = 0
	x1 = (-b + Math.sqrt(d)) / (2 * a)
	puts "diskriminant = #{d}, x1 = #{x1}"
else
	puts "diskriminant = #{d}, Kornei net!"
end