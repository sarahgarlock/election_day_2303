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
  
end