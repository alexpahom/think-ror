# frozen_string_literal: true

class Station
  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def get_trains_by_type(type)
    @trains.select { |train| train.type == type }
  end

  def arrival(train)
    @trains.push train
  end

  def departure(train)
    @trains.delete train
  end
end
