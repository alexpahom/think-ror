# frozen_string_literal: true

require_relative 'train'
require_relative '../modules/validation'

class PassengerTrain < Train

  include Validation
  validate :number, :format, /[A-zА-я0-9]{3}-?[A-zА-я0-9]{2}/
  def initialize(number)
    @kind = :passenger
    super
  end
end
