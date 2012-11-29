class Object
  def rarray(name,&configuration_block)
    builder = RArrays::ArrayBuilder.new(name)
    yield builder if block_given?
    builder.apply_to(self)
  end
end
