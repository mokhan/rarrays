module RArrays
  class ArrayBuilder
    attr_reader :steps
    def initialize(name, configuration = {})
      @steps = configuration[:steps]
      @step_factory = configuration[:step_factory]
      @steps << @step_factory.create_for(:init_step)
    end
    def apply_to(target)

    end

    def readable
      @steps << @step_factory.create_for(:readable)
    end
    def writeable
      @steps << @step_factory.create_for(:writeable)
    end
    def mutator(name)
      @steps << @step_factory.create_for(:mutator, name)
    end
  end
end
