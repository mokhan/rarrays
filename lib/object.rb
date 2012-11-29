class Object
  def rarray(name)
    attr_reader name
    instance_variable_set("@#{name}", [])
  end
end
