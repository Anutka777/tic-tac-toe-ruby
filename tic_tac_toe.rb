# frozen_string_literal: true

# To control game flow and choose winner
class Game
  attr_reader :player_x, :player_o, :player_active, :board

  def initialize
    @player_x = Players.new('Player1', 'X')
    @player_o = Players.new('Player2', '0')
    @player_active = player_x
    @board = Board.new
  end

  @@WINNING_LINES = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]

  def control_game_flow
    board.print_on_screen
    loop do
      print "#{player_active.name}, please enter the number of the cell you want to place your mark.\n"
      board.place_mark(player_active.mark)
      break if check_winnier != false || check_tie != false

      switch_players
    end
    if check_tie
      tie_game
    else
      game_over
    end
  end

  private

  def switch_players
    if @player_active == @player_x
      @player_active = @player_o
    else
      @player_active = player_x
    end
  end

  def check_winnier
    @@WINNING_LINES.any? do |line|
      line.all? do |el|
        board.cells[el] == @player_active.mark
      end
    end
  end

  def check_tie
    board.cells.all? { |cell| cell.is_a? String }
  end

  def tie_game
    puts 'It\'s a tie game!'
  end

  def game_over
    puts "#{@player_active.name} won the game!"
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
      print '(Enter the number from 1 to 9) >> '
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
  attr_reader :cells

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
    print_on_screen
  end

  private

  def occupancy_check(cell)
    @cells[cell - 1].is_a? Integer
  end
end

new_game = Game.new
new_game.control_game_flow
