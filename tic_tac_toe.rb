# frozen_string_literal: true

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
    board.print_on_screen
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

# To make a move
class Players
  attr_reader :name, :mark

  def ask_player_name
    loop do
      puts 'Player, state your name, please'
      name = gets.chomp
      break name if name != ''
    end
  end

  def ask_player_mark
    loop do
      puts 'And your mark?'
      mark = gets.chomp[0]
      break mark if mark.nil? == false 
    end
  end

  def initialize
    @name = ask_player_name
    @mark = ask_player_mark
  end

  # Returns input
  def self.make_move
    loop do
      print '(Enter the number from 1 to 9) >> '
      input = gets.chomp.to_i
      return input if validate_input(input) == true

      puts ''
      puts 'PLEASE CHECK YOUR INPUT'
      puts ''
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
      cell = Players.make_move
      if occupancy_check(cell) == true
        @cells[cell - 1] = mark
        break
      else
        puts ''
        puts 'MAKE SURE THE CELL IS NOT OCCUPAID'
        puts ''
      end
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
