require 'spec_helper'

module RArrays
  describe ArrayBuilder do
    let(:sut) { ArrayBuilder.new(:blah) }
    context "when configuring an array to be readable" do
      before(:each) do
        sut.readable
      end
      it "should add a readable step to the recipe" do
        sut.steps.include?(:readable).should be_true
      end
    end

    context "when configuring an array to be writeable" do
      before(:each) do
        sut.writeable
      end
      it "should add a writeable step to the recipe" do
        sut.steps.include?(:writeable).should be_true
      end
    end

  end
end
