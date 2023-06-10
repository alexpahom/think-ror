load 'modules/instance_counter.rb'
class Station
  include InstanceCounter
  attr_reader :trains, :name
  @@stations = []
  def self.all
    @@stations
  end
  def initialize(name)
    @name = name
    @trains = []
    @@stations << self
    register_instance
  end

  def arrival(train)
    @trains.push train
  end

  def departure(train)
    @trains.delete train
  end
end
