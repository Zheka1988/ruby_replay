require 'pry'
months = { January: 31, February: 29, March: 31, April: 30,
           May: 31, June: 30, July: 31, August: 31, September: 30,
           October: 31, November: 30, December: 31 }
months.each { |key, value| puts key if value == 30 }

# ____________________________________

massive = []
n = 10
while n < 100
  massive << n
  n += 5
end
print "#{massive} \n"
binding.pry
# _____________________________________

mas_fibo = [1, 1]
loop do
  n = mas_fibo[-1] + mas_fibo[-2]
  break if n > 100

  mas_fibo << n
end
print "Fibonachi - #{mas_fibo} \n"

hash_alfabite = {}
n = 1
('a'..'z').each do |simvol|
  hash_alfabite[simvol] = n
  n += 1
end

puts hash_alfabite
