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
    context 'when adding an aliased mutator method' do
      before(:each) do
        sut.mutator :add_item
      end
      it "should include a new step for the mutator " do
        sut.steps.include?(:mutator).should be_true
      end
    end
  end
end
