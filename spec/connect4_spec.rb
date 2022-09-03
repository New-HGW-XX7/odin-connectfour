require './connect4.rb'

describe Game do
  subject(:game) { described_class.new }
  describe '#initialize' do
    it 'creates a 2D-array with 3 rows' do
      expect(game.board.size).to eq(3)
    end

    it 'creates a 2D-array with 3 columns' do
      expect(game.board[0].size).to eq(3)
      expect(game.board[1].size).to eq(3)
      expect(game.board[2].size).to eq(3)
    end
  end
end