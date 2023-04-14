require './lib/candidate'
require './lib/race'

RSpec.describe Race do
  before(:each) do
    @race = Race.new("Texas Governor")
  end

  describe '#initialilze' do
    it 'exists' do
      expect(@race).to be_a(Race)
    end

    it 'has attributes' do
      expect(@race.office).to eq("Texas Governor")
    end

    it 'starts with an ampty array of canidates' do
      expect(@race.candidates).to eq([])
    end

    it 'can register canidates for a race' do
      candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})
    end
  end

end