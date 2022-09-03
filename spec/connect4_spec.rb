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
end