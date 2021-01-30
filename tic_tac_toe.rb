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

  def self.ask_and_return_mark_place
    puts 'Where do you want to put a mark?'
    puts 'Enter the number of the cell.'
    @choice = gets
  end
end

puts 'Player 1, what is your name?'
p1 = Players.new(gets)
puts p1.name
puts 'Player 2, what is your name?'
p2 = Players.new(gets)
puts p2.name

board = Board.new
board.draw_board

Board.new
puts Board.ask_and_return_mark_place
