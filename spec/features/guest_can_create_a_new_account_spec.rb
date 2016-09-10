require 'rails_helper'

RSpec.feature "guest can create a new account" do
  context "with valid params" do
    scenario "guest fills out form and signs up for account" do
      visit root_path
      click_on 'Create Account'
      fill_in 'user_name', with: 'Test'
      fill_in 'user_birthday', with: '1-1-1990'
      fill_in 'user_email', with: 'test@test.com'
      fill_in 'user_username', with: 'test'
      fill_in 'user_password', with: 'testing'
      fill_in 'user_password_confirmation', with: 'testing'
      click_on 'Sign Up'

      expect(page).to have_content("Test's Battleplan")
      expect(page).to have_content("Name: Test")
      expect(page).to have_content("Birthday: 01/01/1990")
      expect(page).to have_content("Email Address: test@test.com")
      expect(page).to_not have_content("Create Account")
      expect(page).to_not have_content("Log In")
      expect(page).to have_content("Log Out")
    end
  end
end
