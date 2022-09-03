require './connect4.rb'

describe Game do
  subject(:game) { described_class.new }
  describe '#initialize' do
    it 'creates a 2D-array with 3 rows' do # Array size will be changed later
      expect(game.grid.size).to eq(3)
    end

    it 'creates a 2D-array with 3 columns' do
      expect(game.grid[0].size).to eq(3)
      expect(game.grid[1].size).to eq(3)
      expect(game.grid[2].size).to eq(3)
    end
  end

  describe '#player_column_choice' do
    it 'puts the correct message to the console' do
      expect(game).to receive(:puts).with('Player 1, choose a column').once
      game.player_column_choice(1)
    end
  end

  describe '#column_full?' do
    it 'returns true if selected column is not nil in top row' do
      game.grid[0][0] = 'x'
      expect(game.column_full?(0)).to be true
    end
  end

  describe '#game_over?' do
    it 'returns true if all columns are full' do
      game.grid[0][0] = 'x'
      game.grid[0][1] = 'x'
      game.grid[0][2] = 'x'
      expect(game.game_over?).to be true
    end
  end
end