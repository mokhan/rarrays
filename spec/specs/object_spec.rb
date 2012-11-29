require "spec_helper"
module RArrays
  describe Object do
    before (:each) do
      fake_class ArrayBuilder
    end

    class AddressBook
      def intialize
        rarray :contacts
      end
    end
    let(:item){AddressBook.new}

    context 'when initiating a usage of the array building dsl' do
      it "should have created an array builder with the minimal info it needs to start building an array" do
        ArrayBuilder.should have_received(:new,:contacts)
      end
    end
  end

end
