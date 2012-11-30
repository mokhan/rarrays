require 'spec_helper'

module RArrays
  describe ArrayBuilder do
    let(:sut) { ArrayBuilder.new(:blah) }
    context "when configuring an array to be readable" do
      before(:each) do
        class Item
          def initializer
            rarray :blah do |c|
              c.readable
            end
          end
        end
      end
      it "should add a readable step to the recipe" do
        sut.steps.include?(:readable).should be_true
      end
    end
  end
end
