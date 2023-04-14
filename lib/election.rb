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
    @election.races.flat_map(&:candidates).uniq
  end
end