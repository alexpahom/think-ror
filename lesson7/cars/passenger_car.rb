require_relative 'car'

class PassengerCar < Car
  attr_reader :seats_taken_number

  def initialize(max_seats)
    @type = :passenger
    @max_seats = max_seats.to_i
    @seats_taken_number = 0
    super()
    validate!
  end

  def take_seat
    @seats_taken_number += 1 unless @seats_taken_number == @max_seats
  end

  def vacant_seats_number
    @max_seats - seats_taken_number
  end

  private

  def validate!
    raise 'Количество мест не может быть отрицательным или нулевым' if @max_seats < 1
  end
end
