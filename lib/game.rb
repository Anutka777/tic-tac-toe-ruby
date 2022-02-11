# frozen_string_literal: true

require_relative 'players'
require_relative 'board'

WINNING_LINES = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
].freeze

# To control game flow and choose winner
class Game
  attr_reader :player_x, :player_o, :player_active, :board

  def initialize
    greet
    @player_x = Players.new
    @player_o = Players.new
    @player_active = player_x
    @board = Board.new
  end

  def control_game_flow
    board.print_itself
    loop do
      print "#{player_active.name}, please enter the number of the cell you want to place your mark\n"
      board.place_mark(player_active.mark)
      break if check_for_winnier != false || check_for_tie != false

      switch_players
    end
    if check_for_tie
      tie_game_over
    else
      game_over
    end
  end

  private

  def greet
    puts "
    ╔╦╗┬┌─┐  ╔╦╗┌─┐┌─┐  ╔╦╗┌─┐┌─┐
     ║ ││     ║ ├─┤│     ║ │ │├┤ 
     ╩ ┴└─┘   ╩ ┴ ┴└─┘   ╩ └─┘└─┘
    "
    puts 'THE GAME TAKES TWO TO PLAY. INRODUCE YOURSELVES AND CHOOSE YOUR MARKS.'
    puts ''
  end

  def switch_players
    if @player_active == @player_x
      @player_active = @player_o
    else
      @player_active = player_x
    end
  end

  def check_for_winnier
    WINNING_LINES.any? do |line|
      line.all? do |el|
        board.cells[el] == @player_active.mark
      end
    end
  end

  def check_for_tie
    board.cells.all? { |cell| cell.is_a? String }
  end

  def tie_game_over
    puts 'It\'s a tie game!'
  end

  def game_over
    puts "#{@player_active.name} won the game!"
    puts 'Thanks for playing.'
  end
end

# new_game = Game.new
# new_game.control_game_flow
