require_relative './player'
require 'colorize'

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
    board.each do |row|
      row.each_with_index do |slot, index|
        case index
        when 2 || 5 || 8
          puts slot.colorize(:color => :light_green)
        else
          print slot.colorize(:color => :light_green)
        end
      end
    end
  end


  def extract_slot(slot)
    slot_number = slot[1]
    slot_number
  end[


  def update_board(player, current_space)
    brackets = ["[".colorize(:color => :light_green), 
                "]".colorize(:color => :light_green)]

    current_space = current_space.to_i
    board.each_with_index do |row, row_index|
      row.each_with_index do |slot, slot_index|
        slot = self.extract_slot(slot)
        if slot.to_i == current_space
          self.board[row_index][slot_index] = brackets[0] + 
                                              player.symbol + brackets[1]
        end
      end
    end
  end
end
