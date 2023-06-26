# frozen_string_literal: true

require_relative 'modules/instance_counter'
require_relative 'modules/accessors'
require_relative 'modules/validation'

class Station
  include InstanceCounter
  include Validation
  extend Accessors
  attr_reader :trains

  attr_accessor_with_history :name
  validate :name, :presence

  def self.all_stations
    @stations
  end

  def self.add_station(station)
    @stations ||= []
    @stations << station
  end

  def initialize(name)
    @name = name
    @trains = []
    validate!
    self.class.add_station self
    register_instance
  end

  def arrival(train)
    @trains.push train
  end

  def departure(train)
    @trains.delete train
  end

  def within_trains(&block)
    trains.each { |train| block.call(train) }
  end
end
