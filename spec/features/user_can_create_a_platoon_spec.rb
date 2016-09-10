require 'rails_helper'

RSpec.feature "user can create a platoon" do
  scenario "logged in user can create and view a platoon" do
    user = create_user
    ApplicationController.any_instance.stubs(:logged_in?).returns(true)
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit profile_path
    click_on "Create Platoon"
    fill_in "platoon_name", with: "rocker"
    click_on "Deploy Platoon"

    expect(page).to have_content("Test0's Platoons")
    expect(page).to have_content("Rocker Platoon: 0 Bots Stationed")
  end
end
