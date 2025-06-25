require 'colorize'
require_relative 'lib/player'
require_relative 'lib/board'

players = [Player.new('X'.colorize(:color => :light_grey), "player_1"), 
           Player.new('O'.colorize(:color => :light_yellow), "player_2")]

board = Board.new(players)

player_colors = {:player_1 => {:color => :light_grey},
                 :player_2 => {:color => :light_yellow}}

puts "\n\n"

puts "Welcome to Tic Tac Toe!\n\n".colorize(:color => :light_red)

game = "true"
player_1_turn = "Player_1 is [X] colored ORANGE".colorize(:color => :yellow)
player_2_turn = "Player_2 is [O] colored YELLOW\n\n".
  colorize(:color => :light_yellow)

messages = [player_1_turn, player_2_turn]

while game == "true"
  puts "Pick the space you want by typing the".colorize(:color => :light_red)
  puts "(Number) and hitting the [ENTER] Key\n".colorize(:color => :light_red)

  players.each_with_index do |choice, index|
    board.show_board
        
    space_check = false
    while space_check == false
      space = gets.chomp
      space = space.to_i
      if space < 1 || space > 9  
        puts"Number needs to be between [1] and [9]".
          colorize(:color => :red)
      else
        players[index].take_space(space)
        space_check = true
      end
    end
  end
  game_check = "false"
end
