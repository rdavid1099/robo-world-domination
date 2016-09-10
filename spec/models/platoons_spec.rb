require 'rails_helper'

RSpec.describe Platoon, type: :model do
  it "is created with proper params" do
    platoon = create_platoon

    expect(platoon).to be_valid
  end

  it "is initialized with a default value of 0 wins and 0 losses" do
    platoon = create_platoon

    expect(platoon.num_of_wins).to eq(0)
    expect(platoon.num_of_losses).to eq(0)
  end

  it "is not initialized if no name is given" do
    user = create_user
    platoon = user.platoons.new

    expect(platoon.save).to eq(false)
    platoon.name = 'test'
    expect(platoon.save).to eq(true)
  end
end
