module ClassLevelInheritableAttributes
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def inheritable_attributes(*args)
      @inheritable_attributes ||= [:inheritable_attributes]
      if args.include?(:m1)
        class_eval %(
          def #{args[0]}(name) "Hello \#{name}" end
        )
        return
      else
        @inheritable_attributes += args
        args.each do |arg|
          class_eval %(
              class << self; attr_accessor :#{arg} end
            )
        end
    end
      @inheritable_attributes
    end

    # - method ustanavlivaet  znacheniya peremennix podclassa,
    # takimi zhe kak u roditelya
    def inherited(subclass)
      @inheritable_attributes.each do |inheritable_attribute|
        instance_var = "@#{inheritable_attribute}"
        subclass.instance_variable_set(instance_var, instance_variable_get(instance_var))
      end
    end
  end
end
