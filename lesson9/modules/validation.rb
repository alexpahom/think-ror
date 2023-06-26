# frozen_string_literal: true

module Validation

  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    attr_accessor :validations

    def validate(attribute, validation, args = '')
      self.validations ||= []
      validations << {
        validation => {
          name: attribute,
          params: args
        }
      }
    end
  end

  module InstanceMethods

    def validate!
      self.class.validations.each do |validation|
        validation.each do |type, args|
          variable = instance_variable_get("@#{args[:name]}")
          send(type, variable, args[:params])
        end
      end
    end

    def valid?
      validate!
    rescue StandardError
      false
    end

    private

    def presence(value, _arg)
      raise 'Не может быть пустым!' if value.nil? || value.empty?
    end

    def type(value, klass)
      raise 'Неверное значение!' unless value.is_a?(klass)
    end

    def format(value, pattern)
      raise 'Неверный формат!' unless value =~ pattern
    end
  end
end
