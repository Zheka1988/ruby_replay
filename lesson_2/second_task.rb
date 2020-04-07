puts 'Vvedite chislo, mesyac i god'
chislo = gets.chomp.to_i
mesyac = gets.chomp.to_i
god = gets.chomp.to_i
month_name = %i[January February March April May June
                July August September October November December]

count_day = { January: 31, February: 28, March: 31, April: 30,
              May: 31, June: 30, July: 31, August: 31, September: 30,
              October: 31, November: 30, December: 31 }

def god_visokosniy?(god)
  god % 4 == 0 && god % 100 != 0 ? true : false
end

# i = 0
resultat = 0
month_name.each.with_index(1) do |month, index|
  resultat += count_day[month] if index < mesyac
end

# while i <= mesyac -2
#   resultat += count_day[month_name[i]]
#   i += 1
# end
resultat += 1 if god_visokosniy?(god)
puts resultat + chislo
