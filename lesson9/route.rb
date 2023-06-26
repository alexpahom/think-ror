# frozen_string_literal: true

require_relative 'modules/instance_counter'
require_relative 'modules/validation'
require_relative 'modules/accessors'
require_relative 'station'

class Route
  include InstanceCounter
  include Validation
  extend Accessors
  attr_reader :start_station, :end_station

  strong_attr_accessor :start_station, Station
  strong_attr_accessor :end_station, Station
  validate :start_station, :type, Station
  validate :end_station, :type, Station

  def initialize(start_station, end_station)
    @start_station = start_station
    @end_station = end_station
    @in_between_stations = []
    validate!
    register_instance
  end

  def delete_station(station)
    @in_between_stations.delete station
  end

  def add_station(station)
    @in_between_stations.push station
  end

  def stations
    [@start_station] + @in_between_stations + [@end_station]
  end
end
