# frozen_string_literal: true

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
