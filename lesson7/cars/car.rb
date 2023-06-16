require_relative '../modules/manufacturer.rb'
class Car
  include Manufacturer
  attr_reader :type, :number

  def initialize
    @number = rand(1..10000)
  end
end
