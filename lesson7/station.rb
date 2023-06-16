# frozen_string_literal: true

require_relative 'modules/instance_counter'

class Station
  include InstanceCounter
  attr_reader :trains, :name

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

  def valid?
    validate!
  rescue StandardError
    false
  end

  def within_trains(&block)
    trains.each { |train| block.call(train) }
  end

  private

  def validate!
    raise 'Название не может быть пустым' if name.empty?
  end
end
