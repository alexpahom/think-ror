# frozen_string_literal: true

require_relative 'car'

class CargoCar < Car
  attr_reader :loaded

  def initialize(max_load)
    @kind = :cargo
    @max_load = max_load.to_i
    @loaded = 0
    super()
    validate!
  end

  def load_car(amount)
    raise "Нельзя превышать объем! (#{loaded} / #{@max_load})" if @loaded + amount.to_i > @max_load

    @loaded += amount.to_i
  end

  def free_load
    @max_load - loaded
  end

  private

  def validate!
    raise 'Вместимость не может быть отрицательной или нулевой' if @max_load < 1
  end
end
