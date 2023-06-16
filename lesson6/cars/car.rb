# frozen_string_literal: true

require_relative '../modules/manufacturer'
class Car
  include Manufacturer
  attr_reader :type
end
