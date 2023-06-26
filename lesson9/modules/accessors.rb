# frozen_string_literal: true

module Accessors

  def attr_accessor_with_history(*names)
    names.each do |name|
      attr_name = name.to_s
      attr_reader attr_name

      define_method "#{attr_name}_history" do
        instance_variable_get("@#{attr_name}_history") || [nil]
      end

      define_method "#{attr_name}=" do |new_value|
        v = instance_variable_get("@#{attr_name}_history")
        v ||= [nil]
        v << new_value

        instance_variable_set("@#{attr_name}_history", v)
        instance_variable_set("@#{attr_name}", new_value)
      end
    end
  end

  def strong_attr_accessor(name, klass)
    attr_name = name.to_s
    attr_reader attr_name

    define_method "#{attr_name}=" do |new_value|
      raise ArgumentError unless new_value.is_a? klass

      instance_variable_set("@#{attr_name}", new_value)
    end
  end
end
