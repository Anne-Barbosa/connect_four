# frozen_string_literal: true

require_relative '../lib/player'

describe Player do
  describe "#initialize" do
    it "initializes with a name and a marker" do
      player = Player.new('Alice', '🔴')
      expect(player.name).to eq('Alice')
      expect(player.marker).to eq('🔴')
    end
  end

  describe "#to_s" do
    it "returns a formatted string with name and marker" do
      player = Player.new('Alice', '🔴')
      expect(player.to_s).to eq('Alice (🔴)')
    end
  end
end