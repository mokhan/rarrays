
module RArrays
  class ModuleRegistry
    def find_for(symbol)
      module_name = "#{symbol.to_s.capitalize}Behavior"
      RArrays.const_get(module_name)
    end
  end
end
