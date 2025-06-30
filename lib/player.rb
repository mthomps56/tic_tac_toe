require_relative 'grid_spaces'

class Player
  attr_accessor :grid_spaces, :player_symbol
  attr_writer   :player_number
  def initialize(player_symbol, player_name)
    @player_number = player_name
    @player_symbol = player_symbol
    @grid_spaces = Grid_spaces.new
  end

  def take_space(space)
    grid_spaces.spaces << space - 1
  end
end 
