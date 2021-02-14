# frozen_string_literal: true

# To control game flow and choose winner
class Game
  attr_reader :player_x, :player_o, :board

  def initialize
    @player_x = Players.new('Player1', 'X')
    @player_o = Players.new('Player2', '0')
    @board = Board.new
  end

  def control_game_flow
    board.print_on_screen
    loop do
      print "#{player_x.name}, please enter the number of the cell you want to place your mark.\n"
      board.place_mark(player_x.mark)
      board.print_on_screen
      break if check_winnier == true
      print "#{player_o.name}, please enter the number of the cell you want to place your mark.\n"
      board.place_mark(player_o.mark)
      board.print_on_screen
      break if check_winnier == true
    end
    game_over
  end

  def check_winnier
    true
  end

  def game_over
    puts 'Thanks for playing.'
  end
end

# To make a move
class Players
  attr_reader :name, :mark

  def initialize(name, mark)
    @name = name
    @mark = mark
  end

  # Returns input
  def self.make_move
    loop do
      print '(Enter the number from 1 to 9) > '
      input = gets.chomp.to_i
      break input if validate_input(input) == true
    end
  end

  def self.validate_input(input)
    input >= 1 && input <= 9 ? true : false
  end
end

# To show current state of the game
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
      -------------
    HEREDOC
  end

  def place_mark(mark)
    loop do
      puts 'Make sure the cell is not occupaid'
      cell = Players.make_move
      break @cells[cell - 1] = mark if occupancy_check(cell) == true
    end
  end

  private

  def occupancy_check(cell)
    @cells[cell - 1].is_a? Integer
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

new_game = Game.new
# p new_game.player_o
# p new_game.player_x.make_move
# p new_game.board
# new_game.board.place_mark(new_game.player_x.make_move, new_game.player_x.mark)
# new_game.board.place_mark(19, 'O')
# new_game.board.print_on_screen
# p new_game.player_x.validate_input(22.to_i)
new_game.control_game_flow
# p Players.make_move
