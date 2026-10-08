# frozen_string_literal: true

require_relative '../lib/board'

describe Board do
  describe "#initialize" do
    it 'creates a grid with 6 rows' do
      board = Board.new
      expect(board.grid.length).to eq(6)
    end

    it 'creates a grid with 7 columns' do
      board = Board.new
      expect(board.columns).to eq(7)

      expect(board.grid.first.length).to eq(7)
    end
  end

  describe "#drop_piece" do 
    it 'drops a piece to the lowest available row in the chosen column' do
      board = Board.new

      board.drop_piece(0, 'X')

      expect(board.cell_at(5, 0)).to eq('X')
    end
  end

  describe "#drop_piece (edge cases)" do
    it 'return false and does not drop a piece if the columns is full' do
      board = Board.new
      
      6.times { board.drop_piece(0, 'X') }

      result = board.drop_piece(0, 'O')

      expect(result).to be false

      expect(board.cell_at(0, 0)).to eq('X')
    end
  end

  describe "#full?" do
    it 'returns false when the board is empty' do
      board = Board.new
      expect(board.full?).to be false
    end

    it 'returns true when the board is completely full' do
      board = Board.new

      7.times do |col|
        6.times do
          board.drop_piece(col, 'X')
        end
      end

      expect(board.full?).to be true
    end
  end
end
