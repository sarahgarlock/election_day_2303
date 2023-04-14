class Election
  attr_reader :year,
              :races

  def initialize(year)
    @year = year
    @races = []
  end

  def add_race(race)
    @races << race
  end

  def candidates
    races.flat_map(&:candidates).uniq { |candidate| [candidate.name, candidate.party] }
  end

  def vote_counts
    #   undefined method `[]' for #<Candidate:0x00007fc7f42a6d40>
    counts = Hash.new(0)
    @races.each do |race|
      race.votes.each do |candidate, votes|
        counts[candidate.name] += votes
      end
    end
    counts
  end
end