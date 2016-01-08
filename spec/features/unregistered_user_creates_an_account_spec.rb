require 'rails_helper'

RSpec.feature "Unregistered user creates a new account" do
  scenario "they see the dashboard for their account" do
    email = "sally@fakeaccount.com"
    password = "sallyisthebest"
    name = "Sally"

    visit new_user_path
    fill_in "Name", with: name
    fill_in "Email", with: email
    fill_in "Password", with: password
    fill_in "Password confirmation", with: password
    click_on "Create Account"

    user = User.last
    expect(page).to have_content user.name
    expect(page).to have_content "Account created!"
  end

  context "the name is left blank" do
    scenario "they see an error message" do
      password = "sallyisthebest"

      visit new_user_path
      fill_in "Password", with: password
      fill_in "Password confirmation", with: password
      click_on "Create Account"

      expect(page).to have_content "Your email or password is incorrect."
    end
  end

  context "the password confirmation is left blank" do
    scenario "they see an error message" do
      email = "sally@fakeaccount.com"
      password = ""

      visit new_user_path
      fill_in "Email", with: email
      fill_in "Password", with: password
      fill_in "Password confirmation", with: password
      click_on "Create Account"

      expect(page).to have_content "Your email or password is incorrect."
    end
  end

  context "the passwords do not match" do
    scenario "they see an error message" do
      email = "sally@fakeaccount.com"
      password_1 = "sallyisthebest"
      password_2 = "sallyistheworst"

      visit new_user_path
      fill_in "Email", with: email
      fill_in "Password", with: password_1
      fill_in "Password confirmation", with: password_2
      click_on "Create Account"

      expect(page).to have_content "Your email or password is incorrect."
    end
  end
end
