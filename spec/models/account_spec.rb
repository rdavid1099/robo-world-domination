require 'rails_helper'

RSpec.describe Account, type: :model do

  it "can be created" do
    account = Account.new(user_id: 1, record_id: 2)

    expect(account).to be_valid
  end

  it "cannot be created if user_id is not provided" do
    account = Account.new(record_id: 2)

    expect(account).to be_invalid
  end

  it "cannot be created if record_id is not provided" do
    account = Account.new(user_id: 1)

    expect(account).to be_invalid
  end

end
