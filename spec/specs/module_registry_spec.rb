require 'spec_helper'

module RArrays
  class TestBehavior

  end
  describe ModuleRegistry do
    let(:sut) { ModuleRegistry.new }

    context "when looking for a module by symbol name" do
      let(:result) { sut.find_for(:test) }

      it "should return the correct module" do
        result.should == TestBehavior
      end
    end
  end
end
