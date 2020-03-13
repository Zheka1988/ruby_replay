puts "Vvedite storony treugol'nika!"
puts "a?"
a = gets.chomp.to_i
puts "b?"
b = gets.chomp.to_i
puts "c?"
c = gets.chomp.to_i
sides = [a, b, c].sort

def pryamougolniy?(sides)
	sides[2]**2 == sides[0]**2 + sides[1]**2 ? "prymougolniy" : "ne prymougolniy"
end

def ravnobedrenniy?(a,b,c)
	a==b || a==c || c==b ? "ravnobedrenniy" : "ne ravnobedrenniy"	
end

def ravnostoronniy?(a,b,c)
	a==b && a==c ? "ravnostoronniy" : "ne ravnostoronniy"
end

puts "treugol'nik #{pryamougolniy?(sides)} #{ravnobedrenniy?(a,b,c)}
	 #{ravnostoronniy?(a,b,c)}"