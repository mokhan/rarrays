require 'spec_helper'

describe Object do
  context 'when initiating a usage of the array building dsl' do
    let(:builder){fake}
    before (:each) do
      RArrays::ArrayBuilder.stub(:new).and_return(builder)
      @configured = false
    end

    before (:each) do
      rarray :contacts do|item|
        @item = item
        @configured = true
      end
    end
    
    it "should configure the builder using the provided configuration block" do
      @configured.should be_true
      @item.should == builder
    end

    it 'should tell the builder to apply itself against the target' do
      rarray :items
      builder.should have_received(:apply_to,self)
    end
  end
end

