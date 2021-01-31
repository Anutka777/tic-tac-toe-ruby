# frozen_string_literal: true

# Tic-tac-toe
class Game
  def self.ask_players_names
    puts 'Player 1, what is your name?'
    player1 = gets.chomp!
    Players.new(player1, 'X')
    puts "Hello, #{player1}!\nYou will be playing with X mark"
    puts 'Player 2, what is your name?'
    player2 = gets.chomp!
    Players.new(player2, 'O')
    puts "Hello, #{player2}!\nYou will be playing with 0 mark"
  end

  def initialize(player1, player2)
    @player_x = player1
    @player_o = player2
  end
end

# Players
class Players
  attr_reader :name

  def initialize(name, mark)
    @name = name
    @mark = mark
  end
end

# Board
class Board
  def initialize
    @cell1 = 1
    @cell2 = 2
    @cell3 = 3
    @cell4 = 4
    @cell5 = 5
    @cell6 = 6
    @cell7 = 7
    @cell8 = 8
    @cell9 = 9
  end

  def draw_board
    puts '-------------'
    puts "| #{@cell1} | #{@cell2} | #{@cell3} |"
    puts '-------------'
    puts "| #{@cell4} | #{@cell5} | #{@cell6} |"
    puts '-------------'
    puts "| #{@cell7} | #{@cell8} | #{@cell9} |"
    puts '-------------'
  end

  def self.ask_and_validate_mark_placement
    puts 'Where do you want to put a mark?'
    puts 'Enter the number of a cell you want to occupy.'
    @place = gets.chomp!.to_i
    until @place >= 1 && @place <= 9
      puts 'Pick a number of the cell from 1 to 9'
      @place = gets.chomp!.to_i
    end
    return @place
  end

  def self.put_mark(mark = '.')
    @cell_choice = Board.ask_and_validate_mark_placement
    p @cell_choice
  end
end

# board = Board.new
# board.draw_board

# Board.new
# Board.put_mark

Game.ask_players_names
