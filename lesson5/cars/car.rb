# frozen_string_literal: true

load '../modules/manufacturer.rb'
class Car
  include Manufacturer
  attr_reader :type
end
