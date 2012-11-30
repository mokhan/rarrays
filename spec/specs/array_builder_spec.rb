require 'spec_helper'

module RArrays
  describe ArrayBuilder do
    let(:step_factory){fake}
    let(:sut) { ArrayBuilder.new(attribute,:step_factory => step_factory,:steps => steps) }
    let(:attribute) { :blah }
    let(:steps) { [] }

    context "when configuring an array to be readable" do
      let(:readable_step) {fake}
      before(:each) do
        step_factory.stub(:create_for).with(:readable).and_return(readable_step)
      end
      before(:each) do
        sut.readable
      end
      it "should add a readable step to the recipe" do
        steps.include?(readable_step).should be_true
      end
    end

    context "when configuring an array to be writeable" do
      let(:writeable_step) { fake }
      before(:each) do
        step_factory.stub(:create_for).with(:writeable).and_return(writeable_step)
      end
      before(:each) do
        sut.writeable
      end
      it "should add a writeable step to the recipe" do
        steps.include?(writeable_step).should be_true
      end
    end
    context 'when adding an aliased mutator method' do
      let(:mutator_step) { fake }
      before(:each) do
        step_factory.stub(:create_for).with(:mutator,:add_item).and_return(mutator_step)
      end
      before(:each) do
        sut.mutator :add_item
      end
      it "should include a new step for the mutator " do
        steps.include?(mutator_step).should be_true
      end
    end

    context 'builder that has been initialized' do
      let(:init_step) { fake }
      before(:each) do
        step_factory.stub(:create_for).with(:init_step).and_return(init_step)
        sut
      end

      context 'when created' do
        it 'add initialization step' do
          steps.include?(init_step).should be_true
        end
      end

      context "when applied against a target" do
        let(:target) { fake} 
        before(:each) do
          steps.push(fake)
          steps.push(fake)
        end
        before(:each) do
          sut.apply_to(target)
        end
        it "should run each step against the target" do
          steps.each do |step|
            step.should have_received(:run_against,{ :target => target, :attribute => attribute})
          end
        end
      end
    end
  end
end
