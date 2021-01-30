# frozen_string_literal: true

# Tic-tac-toe
class Game
end

# Players
class Players
  attr_reader :name

  def initialize(name)
    @name = name
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

  def self.ask_mark_place
    puts 'Where do you want to put a mark?'
    puts 'Enter the number of a cell you want to occupy.'
    place = gets.chomp!.to_i
    until place >= 1 && place <= 9
      puts 'Pick a number of the cell from 1 to 9'
      place = gets.chomp!.to_i
    end
    return place
  end

  def self.put_mark(mark = '.')
    @choice = Board.ask_mark_place
    p @choice
  end
end

# puts 'Player 1, what is your name?'
# p1 = Players.new(gets.chomp!)
# puts "Hello, #{p1.name}! You will be playing with X mark"
# puts 'Player 2, what is your name?'
# p2 = Players.new(gets.chomp!)
# puts "Hello, #{p2.name}! You will be playing with 0 mark"

board = Board.new
board.draw_board

Board.new
Board.put_mark
