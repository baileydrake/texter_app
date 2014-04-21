require 'spec_helper'

describe Message, :vcr => true do
  it "doesn't save message if twilio gives an error" do
    message = Message.new(:body => 'Hey Cod', :to => '84380148', :from => '8434104991')
    message.save.should be_false
  end

  it "adds an error if the number is invalid" do
    message = Message.new(:body => 'Hey Cod', :to => '84380148', :from => '8434104991')
    message.save
    message.errors[:base].should eq ["The 'To' number 84380148 is not a valid phone number."]
  end
end
