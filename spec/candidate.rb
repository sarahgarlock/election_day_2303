require './lib/candidate'

RSpec.describe Candidate do
  before(:each) do
    @diana = Candidate.new({name: "Diana D", party: :democrat})
  end

  describe '#initialize' do
    it 'exists' do
      expect(@diana).to be_a(Candidate)
    end

    it 'has attributes' do
      expect(@diana.name).to eq("Diana D")
      expect(@diana.party).to eq(:democrat)
    end

    it 'starts with 0 votes' do
      expect(@diana.votes).to eq(0)
    end

    it 'can add votes' do
      @diana.vote_for!
      @diana.vote_for!
      @diana.vote_for!

      expect(@diana.votes).to eq(3)

      @diana.vote_for!

      expect(@diana.votes).to eq(4)
    end
  end
end