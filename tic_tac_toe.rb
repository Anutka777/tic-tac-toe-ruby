# frozen_string_literal: true

# Tic-tac-toe
class Game
  def initialize
    @player_x = Players.new('X')
    @player_o = Players.new('0')
    @board = Board.new
  end
end

# Players
class Players
  def initialize(mark)
    @mark = mark
  end
end

# Board
class Board
  def initialize
    @cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def print_on_screen
    puts <<~HEREDOC
      -------------
      | #{@cells[0]} | #{@cells[1]} | #{@cells[2]} |
      -------------
      | #{@cells[3]} | #{@cells[4]} | #{@cells[5]} |
      -------------
      | #{@cells[6]} | #{@cells[7]} | #{@cells[8]} |
    HEREDOC
  end

  def put_mark(cell, mark)
    cells[cell - 1] = mark
  end
end

# def self.ask_players_names
#   puts 'Player 1, what is your name?'
#   player1 = gets.chomp!
#   Players.new(player1, 'X')
#   puts "Hello, #{player1}!\nYou will be playing with X mark"
#   puts 'Player 2, what is your name?'
#   player2 = gets.chomp!
#   Players.new(player2, 'O')
#   puts "Hello, #{player2}!\nYou will be playing with 0 mark"
# end

# def self.ask_and_validate_mark_placement
#   puts 'Where do you want to put a mark?'
#   puts 'Enter the number of a cell you want to occupy.'
#   @place = gets.chomp!.to_i
#   until @place >= 1 && @place <= 9
#     puts 'Pick a number of the cell from 1 to 9'
#     @place = gets.chomp!.to_i
#   end
#   return @place
# end
