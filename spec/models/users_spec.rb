require 'rails_helper'

RSpec.describe User, type: :model do

  it "is initialized with an email, password, avatar" do
    user = create_user

    expect(user).to be_valid
  end

  it "is invalid if email not provided" do
    user = User.create(username: "test",
                       password: "testing",
                       avatar: "mypic.jpg")

    expect(user).to be_invalid
  end

  it "is invalid if password not provided" do
    user = User.create(username: "test",
                       email: "test@test.com",
                       avatar: "mypic.jpg")


    expect(user).to be_invalid
  end

  it "encrypts passwords"do
    user = create_user

    expect(user.password_digest).not_to eq("testing")
  end

  it "is invalid if invalid email is provided" do
    user = User.create(username: "test",
                       email: "test@test.com",
                       password: "testing",
                       avatar: "mypic.jpg")


    expect(user).to be_valid
    user.email = "dude.dude@com"
    expect(user).to be_invalid
    user.email = "dude dude@dud.com"
    expect(user).to be_invalid
  end

  it "provides default avatar source if image is not uploaded" do
    user = User.create(username: "test",
                       email: "test@test.com",
                       password: "testing")


    expect(user.avatar).to eql("/photos/default_avatar.jpg")
  end

  it "is a 'default' account by default" do
    user = create_user

    expect(user.role).to eql("default")
  end

  it "is an 'admin' when declared" do
    admin = create_admin

    expect(admin.role).to eql("admin")
  end
end
