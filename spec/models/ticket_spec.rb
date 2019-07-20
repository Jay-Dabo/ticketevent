require "spec_helper"

RSpec.describe Ticket, :type => :model do

  before(:all) do
    @ticket1 = create(:ticket)
  end

  it "is valid when built from factory" do
    expect(ticket1).to be_valid
  end

  it "is valid when build from random factory" do
    ticket2 = build(:random_ticket)
    expect(ticket2).to be_valid
  end

  it "is invalid when the price is blank" do
    ticket2 = build(:random_ticket, price: nil)
    expect(ticket2).to_not be_valid
  end

end
