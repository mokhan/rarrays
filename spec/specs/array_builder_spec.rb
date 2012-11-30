require 'spec_helper'

module RArrays
  describe ArrayBuilder do
    let(:sut) { ArrayBuilder.new(attribute) }
    let(:attribute) { :justin }
    let(:attribute_builder) { fake }
    let(:target) { Object.new }

    context "when applied against a target instance" do
      before(:each) do
        sut.apply_to(target, attribute_builder)
      end

      it "should invoke the attribute builder against the target with a default initializer for the array" do
        attribute_builder.should have_received(:attach_attribute, { :attribute => :address, :default_value => [], :target => target })
      end
    end
  end
end
