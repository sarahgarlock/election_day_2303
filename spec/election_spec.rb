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
      race1 = Race.new("Colorado Governor")
      race2 = Race.new("California Governor")

      candidate1 = Candidate.new(name: 'Aaron Weld', party: :independent)
      candidate2 = Candidate.new(name: 'Erin Jones', party: :democrat)

      @election.add_race(race1)
      @election.add_race(race2)

      race1.register_candidate!(name: 'Aaron Weld', party: :independent)
      race2.register_candidate!(name: 'Erin Jones', party: :democrat)

      expect(@election.candidates.map { |candidate| [candidate.name, candidate.party] }).to eq([[candidate1.name, candidate1.party], [candidate2.name, candidate2.party]])
    end
  end

  describe '#count votes' do
    it 'returns a hash with each candidates key/value' do
      race1 = Race.new("Colorado Governer")
      race2 = Race.new("California Governer")

      candidate1 = Candidate.new(name: 'Aaron Weld', party: :independent)
      candidate2 = Candidate.new(name: 'Erin Jones', party: :democrat)
      candidate3 = Candidate.new(name: 'Jim Branch', party: :republican)
      candidate4 = Candidate.new(name: 'Betty White', party: :green)

      @election.add_race(race1)
      @election.add_race(race2)

      race1.register_candidate!(candidate1)
      race1.register_candidate!(candidate3)

      race2.register_candidate!(candidate2)
      race2.register_candidate!(candidate4)

      candidate1.add_vote!
      candidate1.add_vote!

      candidate2.add_vote!
      candidate2.add_vote!
      candidate2.add_vote!

      candidate3.add_vote!

      expect(@election.vote_counts).to eq({ "Aaron Weld" => 2,
                                            "Erin Jones" => 3, 
                                            "Jim Branch" => 1, 
                                            "Betty White" => 0 })
    end
  end
end