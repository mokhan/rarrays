require "spec_helper"

describe Object do
  it "should be to able to declaratively define a new array" do
    class AddressBook
      def intialize
        rarray :contacts
      end
    end
    sut = AddressBook.new
    sut.contacts.should_not be_nil
  end
end
