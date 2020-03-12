# puts "What city are you from? "
# city = gets.chomp
# city.upcase!
# puts city

# puts "What is your name?"
# name = gets.chomp
# puts "#{name}, HI!"

# puts "V kakom godu ti rodilsya?"
# year = gets.chomp
# puts "#{name} privet! Tebe primerno #{2020-year.to_i} let."

# puts "Integer please"
# user_num = Integer(gets.chomp)
# puts user_num.class
# user_n = gets.chomp.to_i
# puts user_n.class

# puts "Enter a phrase you'd like to analyze: "
# text = gets.chomp
# words = text.split(" ")

# frequencies = Hash.new(0)
# words.each { |word| frequencies[word]+=1 }

# frequencies = frequencies.sort_by {|word, count| count}
# frequencies.reverse!
# frequencies.each do |word , count|
#   puts word+" "+count.to_s  
# end
# ["ryan", "jane"].each {|string| puts "#{string[1..-1]} "}
#----------------------------------------------------
# movies = { matrix:5, shrek:3, zombie:5, rambo:2 }
# puts "You can 'add', 'delete', 'display', 'update' movies."
# choice = gets.chomp
# case choice
# 	when "add"
# 		puts "Vvedite nazvanie filma!"
# 		title = gets.chomp
# 		puts "Kakoy reiting filma"
# 		rating = gets.chomp
# 	  	if (movies[title.to_sym] == nil) 
# 	        movies[title.to_sym]=rating.to_i
# 	  		puts "Film Added!"
# 	    else
# 	        puts "Film exists!"
# 	    end 		
# 	when "update"
# 		puts "Vvedite nazvanie filma!"
# 		title=gets.chomp
# 	  	if (movies[title.to_sym] == nil) 
# 	  		puts "Error, takogo filma net"
# 	    else
# 	     	puts "Vvedite noviy reiting filma"
# 		  	rating = gets.chomp
# 		    movies[title.to_sym]=rating.to_i
# 		    puts "Updated"
# 	    end
# 	when "display"
#   		movies.each { |movie, rating| puts "#{movie}: #{rating}" }
# 	when "delete"
# 	  	puts "Vvedite nazvanie filma"
# 	  	title = gets.chomp
# 	  	if (movies[title.to_sym]== nil)
# 	    	puts "Net takogo filma"
# 	    else
# 	  		movies.delete(title.to_sym)
# 	    	puts "Film Deleted!"
# 	    end  
# 	else
# 		puts "Error!"
# end
#-----------------------------
# a = 5.12345
# puts a.class
# puts a.floor(3)
#-----------------------------
def max_element_lambda
	l = lambda { return [1,2,3,4] }
	array = l.call
	return array.max
end
puts max_element_lambda
puts "-------------"

def max_element_proc
	p = Proc.new { return [1,2,3,4] }
	array = p.call # zdes' proishodit vozvrat
	puts "Etot kod ne budet vipolnen"
	return array.max 
end
print "#{max_element_proc} \n"

