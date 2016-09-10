require 'rails_helper'

RSpec.describe Robot, type: :model do
  it "is created with the correct params" do
    robot = create_robot

    expect(robot.division.unit_type).to eq("Infantry")
  end

  it "has different health depending on unit type" do
    platoon = create_platoon
    create_robot(platoon, 2)

    expect(platoon.robots.count).to eq(2)
    expect(Robot.first.health).to eq(10)
    expect(Robot.last.health).to eq(15)
  end
end
