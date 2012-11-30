module RArrays
  class ArrayBuilder
    attr_reader :steps
    def initialize(name)
      @steps = []
    end
    def apply_to(target)

    end

    def readable
      @steps << :readable
    end
    def writeable
      @steps << :writeable
    end
    def mutator(name)
      @steps << :mutator
    end
  end
end
