# frozen_string_literal: true

require_relative 'players'

# To show current state of the game
class Board
  attr_reader :cells

  def initialize
    @cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def print_itself
    puts <<~HEREDOC

      -------------
      | #{@cells[0]} | #{@cells[1]} | #{@cells[2]} |
      -------------
      | #{@cells[3]} | #{@cells[4]} | #{@cells[5]} |
      -------------
      | #{@cells[6]} | #{@cells[7]} | #{@cells[8]} |
      -------------

    HEREDOC
  end

  def place_mark(mark)
    loop do
      cell = Players.make_move
      if occupancy_check(cell) == true
        @cells[cell - 1] = mark
        break
      else
        cell_occupied_error
      end
    end
    print_itself
  end

  private

  def occupancy_check(cell)
    # Player's input would be a string, so if it's still Integer it's not yet occupied
    @cells[cell - 1].is_a? Integer
  end

  def cell_occupied_error
    puts ''
    puts 'MAKE SURE THE CELL IS NOT OCCUPAID'
    puts ''
  end
end
