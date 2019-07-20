require "spec_helper"
#require 'active_support/all'

RSpec.describe Event, :type => :model do

  before(:all) do
    @event1 = create(:event)
  end

  it "is valid when built from factory" do
    expect(event1).to be_valid
  end

  it "is valid when built from random factory" do
    event2 = build(:random_event)
    expect(event2).to be_valid
  end

  it "is invalid when the name is blank" do
    event2 = build(:random_event, name: nil)
    expect(event2).to_not be_valid
  end

  it "is invalid when the name shorter than 10 characters" do
    event2 = build(:random_event, name: "123456789")
    expect(event2).to_not be_valid
  end

  it "is invalid when the name longer than 40 characters" do
    event2 = build(:random_event, name: "12345678901234567890123456789012345678901")
    expect(event2).to_not be_valid
  end

  ### not sure how to check if the date is in the past
  # it "is invalid when the date is not in the future" do
  #   event2 = build(:random_event, event_time: )
  #   expect(event2).to_not be_valid
  # end

end
