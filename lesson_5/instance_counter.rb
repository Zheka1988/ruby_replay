module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end
  $count = 0
  module ClassMethods
    def instances
      $count
    end
  end

  module InstanceMethods
    def register_instance
      $count += 1
    end
  end
end
