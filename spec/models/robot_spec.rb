require 'spec_helper'

RSpec.describe Robot, type: :model do

  it "creates robot" do
    robot = Robot.new(name: "test", division: "front-lines")

    expect(robot).to be_valid
  end
end
