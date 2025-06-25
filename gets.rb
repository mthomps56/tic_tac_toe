require 'colorize'

puts "[".colorize(:color => :light_green) + "X".colorize(:color => :light_blue) +
  "]".colorize(:color => :light_green)
