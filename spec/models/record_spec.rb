require 'spec_helper'

RSpec.describe Record, type: :model do

  it "is initialized with a default value of zero wins and losses" do
    record = Record.new

    expect(record.num_of_wins).to eql(0)
    expect(record.num_of_losses).to eql(0)
    expect(record).to be_valid
  end

end
