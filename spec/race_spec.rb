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

    it 'starts with an ampty array of candidates' do
      expect(@race.candidates).to eq([])
    end

    it 'creates a new candidate with the provided data' do
      candidate1 = @race.register_candidate!({name: "Diana D", party: :democrat})

      expect(candidate1).to be_a(Candidate)
      expect(candidate1.name).to eq("Diana D")
      expect(candidate1.party).to eq(:democrat)
    end

    it 'can add candidates to the candidates array' do
      candidate1 = @race.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = @race.register_candidate!({name: "Roberto R", party: :republican})

      expect(@race.candidates).to eq([candidate1, candidate2])
    end
  end

end