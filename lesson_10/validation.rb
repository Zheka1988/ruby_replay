module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_reader :array_validate
    def validate(var, validation, condition = nil)
      @array_validate ||= []
      @array_validate << { validation => { var: var, condition: condition } }
    end
  end

  module InstanceMethods
    def validate!
      self.class.array_validate.each do |validation|
        validation.each do |name, args|
          send(name, instance_variable_get("@#{args[:var]}".to_sym), args[:condition])
        end
      end
    end

    def valid?
      validate!
      true
    rescue StandardError
      false
    end
  end

  def presence(var, _a)
    raise 'Не может быть пустым' if var.is_a?(String) && var.empty?
    raise 'Не может быть пустым' if var.nil?
  end

  def format(var, format)
    raise 'Неправильный формат' if var.to_s !~ format
  end

  def type(var, type)
    raise "Ошибка типа. Нужен #{type}" unless var.is_a?(type)
  end
end
