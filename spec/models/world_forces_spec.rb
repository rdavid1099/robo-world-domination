require 'rails_helper'

RSpec.describe WorldForce, type: :model do

  it "is initialized with zero total_wars_waged" do
    world_forces = WorldForce.new

    expect(world_forces.total_wars_waged).to eql(0)
  end

end
