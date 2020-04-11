require_relative 'player'
require_relative 'user'
require_relative 'diller'
require_relative 'bank'
require_relative 'card_deck'
require_relative 'interface'
require_relative 'hand'

puts '========================'
puts '=======Black Jack======='
puts '========================'
puts 'What is yor name?'
name = gets.chomp
puts "Hi, #{name.capitalize!}!! - U vas krasivoe imya!"
puts '========================'

face = Interface.new(name)
face.start if face.stop_game

puts '========================'
puts '==========Exit=========='
puts '========================'
