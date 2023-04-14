require './lib/candidate'
require './lib/race'
require './lib/election'

RSpec.describe Election do
  before(:each) do
    @election = Election.new("2023")
  end

  describe '#initialize' do
    it 'exists' do
      expect(@election).to be_an(Election)
    end

    it 'has attributes' do
      expect(@election.year).to eq("2023")
      expect(@election.races).to eq ([])
    end
  end 

  describe '#add race' do
    it 'returns added races into an array' do
      race = Race.new("Colorado Governer")
      @election.add_race(race)

      expect(@election.races).to eq ([race])
    end
  end

  describe '#candidates' do
    it 'returns added Candidates into an array' do
      race1 = Race.new("Colorado Governer")
      race2 = Race.new("California Governer")

      candidate1 = Candidate.new(name: 'Aaron Weld', party: :independent)
      candidate2 = Candidate.new(name: 'Erin Jones', party: :democrat)

      race1.register_candidate!(name: candidate1.name, party: candidate1.party)
      race2.register_candidate!(name: candidate2.name, party: candidate2.party)

      @election.add_race(race1)
      @election.add_race(race2)

      expect(@election.candidates).to eq([candidate1, candidate2])


    end
  end
end