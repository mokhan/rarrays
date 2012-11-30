require 'spec_helper'

module RArrays
  describe ArrayBuilder do
    let(:sut) { ArrayBuilder.new(:blah) }
    context "when configuring an array to be readable" do
      it "should add a readable step to the recipe" do
        sut.steps.include?(:readable).should be_true
      end
    end
  end
end
