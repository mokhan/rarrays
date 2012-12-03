require 'spec_helper'

describe StepFactory do
  let(:registry) { fake }
  let(:sut) { StepFactory.new(registry) }

  context "when creating a step for a specific symbol" do
    let(:behaviour) do
      Module.new do
        define_method :run_against do
          p 'running'
        end
      end
    end

    before(:each) do
      registry.stub(:find_for).with(:test_step).and_return(behaviour)
    end

    let(:result) do
      sut.create_for(:test_step)
    end

    it "should return an object with the proper behaviour mixed in" do
      result.respond_to?(:run_against).should be_true
    end
  end
end
