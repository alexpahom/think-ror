# frozen_string_literal: true

require_relative '../modules/manufacturer'
class Car
  include Manufacturer
  attr_reader :type, :number

  def initialize
    @number = rand(1..10_000)
  end
end
