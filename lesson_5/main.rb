require_relative 'train.rb'
require_relative 'cargo_train.rb'
require_relative 'passenger_train.rb'
require_relative 'carriage.rb'
require_relative 'cargo_carriage.rb'
require_relative 'passenger_carriage.rb'
require_relative 'route.rb'
require_relative 'station.rb'
require_relative 'ceed.rb'
require_relative 'interface.rb'
require_relative 'main_interface.rb'

face = Interface.new
main_interface = MainInterface.new(face)
main_interface.start
