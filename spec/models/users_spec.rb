require 'rails_helper'

RSpec.describe User, type: :model do

  it "is initialized with an email, password, avatar" do
    user = User.new(email: "dude@dude.com", password: "testing", avatar: "mypic.jpg", account_id: 1, world_force_id: 1)

    expect(user).to be_valid
  end

  it "is invalid if email not provided" do
    user = User.new(password: "testing", avatar: "mypic.jpg", account_id: 1, world_force_id: 1)

    expect(user).to be_invalid
  end

  it "is invalid if email not provided" do
    user = User.new(password: "testing", avatar: "mypic.jpg", account_id: 1, world_force_id: 1)

    expect(user).to be_invalid
  end

  it "is invalid if password not provided" do
    user = User.new(email: "dude@dude.com", avatar: "mypic.jpg", account_id: 1, world_force_id: 1)

    expect(user).to be_invalid
  end

  it "encrypts passwords"do
    user = User.new(email: "dude@dude.com", password: "testing", avatar: "mypic.jpg", account_id: 1, world_force_id: 1)
    user.save

    expect(user.encrypted_password).not_to eq("testing")
    expect(user.password).to eq(nil)
  end

  it "is invalid if invalid email is provided" do
    user = User.new(email: "dudedude.com", password: "testing", avatar: "mypic.jpg", account_id: 1, world_force_id: 1)

    expect(user).to be_invalid
    user.email = "dude.dude@com"
    expect(user).to be_invalid
    user.email = "dude dude@dud.com"
    expect(user).to be_invalid
  end

  it "provides default avatar source if image is not uploaded" do
    user = User.new(email: "dude@dude.com", password: "testing", account_id: 1, world_force_id: 1)

    expect(user.avatar).to eql("/photos/default_avatar.jpg")
  end

end
