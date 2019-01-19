require './lib/game'

describe Game do
  let(:game) { Game.new }

  context '#new' do
    it 'should be a kind of game' do
      expect(game).to be_a_kind_of(Game)
    end

    it 'should be instantiated with 3 doors' do
      expect(game.door_count).to eq(3)
    end

    it 'should only have one winning door' do
      expect(game.winning_door).to be_a_kind_of(Door)
    end

    it 'can be instantiated with more than 3 doors' do
      new_game = Game.new(500)

      expect(new_game.door_count).to eq(500)
      expect(new_game.winning_door).to be_a_kind_of(Door)
    end
    
    it 'cannot be instantiated with less than 3 doors' do
      expect { Game.new(2) }.to raise_error(StandardError)
      expect { Game.new(1) }.to raise_error(StandardError)
      expect { Game.new(-25) }.to raise_error(StandardError)
    end
  end

  context '#play' do
    it 'should change a door to be picked' do
      expect(game.picked_door).to be nil
      game.play!
      expect(game.picked_door).to be_a_kind_of(Door)
    end
  end
end