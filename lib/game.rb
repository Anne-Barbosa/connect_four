# frozen_string_literal: true

require_relative 'board'
require_relative 'player'

class Game
  attr_reader :board, :players, :current_player

  def initialize(board = Board.new, players = [Player.new('Player 1', '🔴'), Player.new('Player 2', '🟡')])
    @board = board
    @players = players
    @current_player = @players.first
  end

  def switch_player
    @players.rotate!
    @current_player = @players.first
  end

def play(column)
    marker = @current_player.marker
    if @board.drop_piece(column, marker)
      switch_player
      true
    else
      false
    end
  end

  def winner?
    winning_vertical? || winning_horizontal? || winning_diagonal?
  end

  def draw?
    @board.full? && !winner?
  end

  private

  def winning_vertical?
    6.times do |row|
        7.times do |col|
            piece = @board.grid[row][col]
            next if piece == ' '

            if row <= 2 &&
                piece == @board.grid[row + 1][col] &&
                piece == @board.grid[row + 2][col] &&
                piece == @board.grid[row + 3][col]
                return true
            end
        end
    end
    false
  end

  def winning_horizontal?
    6.times do |row|
        7.times do |col|
            piece = @board.grid[row][col]
            next if piece == ' '

            if col <= 3 &&
                piece == @board.grid[row][col + 1] &&
                piece == @board.grid[row][col + 2] &&
                piece == @board.grid[row][col + 3]
                return true
            end
        end
    end
    false
  end

  def winning_diagonal?
    6.times do |row|
        7.times do |col|
            piece = @board.grid[row][col]
            next if piece == ' '

            if row <= 2 && col <= 3 &&
                piece == @board.grid[row + 1][col + 1] &&
                piece == @board.grid[row + 2][col + 2] &&
                piece == @board.grid[row + 3][col + 3]
                return true
            end

            if row >= 3 && col <= 3 &&
                piece == @board.grid[row - 1][col + 1] &&
                piece == @board.grid[row - 2][col + 2] &&
                piece == @board.grid[row - 3][col + 3]
                return true
            end
        end
    end
    false
  end
end
