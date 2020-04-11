puts 'first'
def count_point(arg, &block)
  arg **= 2
  block.call(arg) # ili  yield(arg)
end
puts count_point(2) { |arg_from_def| arg_from_def * 10 }

#----------------------------------------------------
puts 'second'
proc1 = proc { |arg| puts arg + 50 }
proc1.call(20)

#----------------------------------------------------
puts 'third'
l = -> { 50 + 50 }
p = proc { 50 + 50 }
def nas
  yield
end
puts nas { 50 + 50 }
puts nas l
puts nas -> { 50 + 50 }
puts nas p
puts nas proc { 50 + 50 }
