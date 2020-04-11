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

    def presence(var, _a)
      raise "#{var} ne mozhet byt' pustim" if var.is_a?(String) && var.empty?
      raise "#{var} ne mozhet but' pustim" if var.nil?
    end

    def format(var, format)
      raise "#{var} ne sootvetstvuet formatu" if var.to_s !~ format
    end

    def type(var, type)
      raise "#{var} ne sootvetstvuet tipu" unless var.is_a?(type)
    end
  end
end
