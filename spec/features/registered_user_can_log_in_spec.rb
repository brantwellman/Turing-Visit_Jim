require 'rails_helper'

RSpec.feature "Registered users can log into their account" do
  scenario "regular users see the dashboard for their account" do
    user = User.create(name: "Sally", email: "sally@fakeaccount.com", password: "sallyisthebest")
    # extract this to a helper method like "#create_user" or "#create_sally" to use in all the tests

    visit login_path
    fill_in "Email", with: user.email
    fill_in "Password", with: "sallyisthebest"
    click_button "Login"

    expect(page).to have_content user.name
    # add something unique for the show page here, like some CSS expectation once we get there. This would technically pass even if it loaded the user index or something if all we test for is the name existing.
  end

  # scenario "admin user sees the dashboard for all regular users" do
  #   admin = User.create(name: "Jim", email: "jim@fakeaccount.com", password: "bigjim", role: 1)
  #   user_1 = User.create(name: "Sally", email: "sally@fakeaccount.com", password: "sallyisthebest")
  #   user_2 = User.create(name: "Beth", email: "beth@fakeaccount.com", password: "littlemissbully")
  #
  #   visit login_path
  #   fill_in "Email", with: admin.email
  #   fill_in "Password", with: "bigjim"
  #   click_button "Login"
  #
  #   expect(page).to have_content user_1.name
  #   expect(page).to have_content user_2.name
  # end
  #
  context "they leave the name field blank" do
    scenario "they see an error message" do
      user = User.create(name: "Sally", email: "sally@fakeaccount.com", password: "sallyisthebest")

      visit login_path
      fill_in "Password", with: "sallyisthebest"
      click_button "Login"

      expect(page).to have_content "Invalid email or password."
    end
  end
  #
  context "they leave the password field blank" do
    scenario "they see an error message" do
      user = User.create(name: "Sally", email: "sally@fakeaccount.com", password: "sallyisthebest")

      visit login_path
      fill_in "Email", with: "sally@fakeaccount.com"
      click_button "Login"

      expect(page).to have_content "Invalid email or password."
    end
  end

  context "the username and password do not match" do
    scenario "they see an error message" do
      user = User.create(name: "Sally", email: "sally@fakeaccount.com", password: "sallyisthebest")

      visit login_path
      fill_in "Email", with: "sally@fakeaccount.com"
      fill_in "Password", with: "sallyistheworst"
      click_button "Login"

      expect(page).to have_content "Invalid email or password."
    end
  end

end
