class StepFactory
  def initialize(registry)
    @registry = registry
  end
  def create_for(step)
    item = Object.new
    item.extend(@registry.find_for(step))
    item
  end
end
