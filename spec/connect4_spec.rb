require './connect4.rb'

describe Game do
  subject(:game) { described_class.new }
  describe '#initialize' do
    it 'exists' do
      expect(game.board).to be(nil)
    end
  end
end