require_relative './player'
require 'colorize'
require 'pry-byebug'

class Board
  attr_accessor :board, :players
  attr_reader   :winning_rows

  def initialize(players)
    @players = players
    @board = [ 
               ['[1]', '[2]', '[3]'],
               ['[4]', '[5]', '[6]'],
               ['[7]', '[8]', '[9]']
             ]

    @winning_rows = { 0 => [0, 1, 2], 1 => [3, 4, 5],
                      2 => [6, 7, 8], 4 => [0, 3, 6],
                      5 => [1, 4, 7], 6 => [2, 5, 8]
                    }
  end

  def show_board
    brackets = ["[".colorize(:color => :light_green),
                "]".colorize(:color => :light_green)]

    board.each do |row|
      row.each_with_index do |slot, index|
        case index
        when 2 || 5 || 8
          puts slot
        else
          print slot
        end
      end
    end
  end


  def extract_slot(slot)
    # Takes the number out of the string '[1]', '[2]', '[3]', etc and 
    # replaces it with the player symbol: 'X' or 'O' to make '[x]' or '[O]'
    slot_number = slot[1]
    slot_number
  end


  def update_board(player, current_space)
    current_space = current_space.to_i
    board.each_with_index do |row, row_index|
      row.each_with_index do |slot, slot_index|
        slot = self.extract_slot(slot)
        if slot.to_i == current_space
          self.board[row_index][slot_index] = 
            "[".colorize(:color => :light_green) +
            player.player_symbol +
            "]".colorize(:color => :light_green)
        end
      end
    end
  end
end
