# frozen_string_literal: true

require_relative '../lib/game'
require_relative '../lib/board'
require_relative '../lib/player'

describe Game do
  describe "#initialize" do
    it "initializes with a board and two players" do
      game = Game.new

      expect(game.board).to be_a(Board)
      expect(game.players.length).to eq(2)
    end
  end

  describe "#switch_player" do
    it "switches the current player to the other player" do
      game = Game.new
      first_player = game.current_player

      game.switch_player

      expect(game.current_player).not_to eq(first_player)
    end
  end

  describe "#initialize with custom players" do
    it "allows initializing with custom players" do
      player1 = Player.new('Alice', '🔵')
      player2 = Player.new('Bob', '🟢')
      game = Game.new(Board.new, [player1, player2])

      expect(game.players.first.name).to eq('Alice')
      expect(game.players.first.marker).to eq('🔵')
    end
  end

  describe "#play" do
    it "drops the current player marker into the chosen column on the board" do
      game = Game.new 

      game.play(0)

      expect(game.board.cell_at(5, 0)).to eq('🔴')
    end
  end

  describe "winner?" do
    it "return true if a player has 4 pieces in a vertical line" do
      game = Game.new

      game.play(0)
      game.play(1)
      game.play(0)
      game.play(1)
      game.play(0)
      game.play(1)
      game.play(0)

      expect(game.winner?).to be true
    end

    it "return true if a player has 4 pieces in a horizontal line" do
      game = Game.new

      game.play(0)
      game.play(6)
      game.play(1)
      game.play(6)
      game.play(2)
      game.play(6)
      game.play(3)

      expect(game.winner?).to be true
    end

    it "return true if a player has 4 pieces in a diagonal line" do
      game = Game.new

      game.play(0)
      game.play(1)
      game.play(1)
      game.play(2)
      game.play(6)
      game.play(2)
      game.play(2)
      game.play(3)
      game.play(6)
      game.play(3)
      game.play(6)
      game.play(3)
      game.play(3)

      expect(game.winner?).to be true
    end
  end

  describe "#draw?" do
    it "returns true if the board is full and there is no winner" do
      game = Game.new

      allow(game.board).to receive(:full?).and_return(true)
      allow(game).to receive(:winner?).and_return(false)

      expect(game.draw?).to be true
    end
  end
end
