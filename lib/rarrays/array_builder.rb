module RArrays
  class ArrayBuilder
    attr_reader :steps
    def initialize(attribute, configuration = {})
      @attribute = attribute
      @steps = configuration[:steps]
      @step_factory = configuration[:step_factory]
      @steps << @step_factory.create_for(:init_step)
    end
    def apply_to(target)
      @steps.each do |step|
        step.run_against({ :target => target, :attribute => @attribute})
      end
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
