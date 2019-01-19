require './lib/door'

describe Door do
  let(:door) { Door.new }

  context '#new' do
    it 'should be a type of Door' do
      expect(door).to be_a_kind_of(Door)
    end

    it 'should start out as unseen' do
      expect(door.seen).to be false
    end

    it 'should be able to be changed to seen' do
      door.seen!

      expect(door.seen).to be true
    end
    
    it 'should start out as a non-winning door' do
      expect(door.winner).to be false
    end

    it 'should be able to be instantiated as a winning door' do
      new_door = Door.new(true)

      expect(new_door.winner).to be true
    end

    it 'should be able to be changed to a winning door' do
      door.winner!

      expect(door.winner).to be true
    end

    it 'should be instantiated as not picked' do
      expect(door.picked).to be false
    end

    it 'can be changed to picked as true' do
      door.picked!
      
      expect(door.picked).to be true
    end
  end
end