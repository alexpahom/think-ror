class Station
  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def arrival(train)
    @trains.push train
  end

  def departure(train)
    @trains.delete train
  end
end
