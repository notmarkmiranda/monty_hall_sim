require './lib/runner'

describe Runner do
  let(:runner) { Runner.new(games: 100, percentage: 50) }
  context '#new' do
    it 'should be a kind of Runner' do
      expect(runner).to be_a_kind_of(Runner)
    end
  end
end
