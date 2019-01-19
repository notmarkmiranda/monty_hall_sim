require './lib/runner'

describe Runner do
  let(:runner) { Runner.new(games: 5, percentage: 50) }
  context '#new' do
    it 'should be a kind of Runner' do
      expect(runner).to be_a_kind_of(Runner)
    end
  end

  context '#run!' do
    let(:game_double) { double('Game') }
    it 'should call Game as many times as games are passed in' do
      expect(Game).to receive(:new).exactly(5).times.and_return(game_double)
      expect(game_double).to receive(:play!).exactly(5).times
      
      runner.run!
    end
  end
end
