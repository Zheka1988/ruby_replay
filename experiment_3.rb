module DogMixin
  class << self
    def included(base)
      base.extend ClassMethods
    end
  end

  module ClassMethods
    def assign(*names)
      class_variable_set(:@@dog_names, names)
    end

    def dog_names
      class_variable_get(:@@dog_names)
    end
  end
end
class A
  include DogMixin
    # assign "Ara"---Esli roditelyu ne prisvaivati znachenie, to C.dog_name  
    #vidast error t/k. @@dog_names u nee net
end

class B < A
  assign "Bob"
end

class C < A

end