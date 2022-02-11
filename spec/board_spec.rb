# frozen_string_literal: true

require 'board'

describe Board do
  context 'The design was built uppon the fact that board should been initialized with integers and then players rewrite them during the game process with string values, so it' do
    it 'contains only integer values' do
      expect(subject.cells).to all(be_an(Integer))
    end
  end

  describe '#print_itself' do
    it 'outputs board on console' do
      expect { subject.print_itself }.to output.to_stdout
    end
  end

  describe '#place_mark' do
    it ''
  end
end
