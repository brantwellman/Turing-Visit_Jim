require 'rails_helper'

RSpec.feature "Unregistered user creates a new account" do
  scenario "they see the dashboard for their account" do
    email = "sally@fakeaccount.com"
    password = "sallyisthebest"

    visit new_user_path
    fill_in "Email", with: email

    # coded tests using email as login instead of name, which might not be unique. Probably makes sense to have their email in our system anyway (it's super easy to use the Pony app to send emails, so let's trigger an email confirmation for successfully redeemed rewards.)

    fill_in "Password", with: password
    fill_in "Password confirmation", with: password
    click_on "Create Account"

    expect(page).to have_content name
  end

#   context "the name is left blank" do
#     password = "sallyisthebest"
#
#     visit new_user_path
#     fill_in "Password", with: password
#     fill_in "Password confirmation", with: password
#     click_on "Create Account"
#
#     expect(page).to have_content "Please fill in all fields."
#   end
#
#   context "the password confirmation is left blank" do
#     email = "sally@fakeaccount.com"
#
#     visit new_user_path
#     fill_in "Email", with: email
#     fill_in "Password", with: password
#     click_on "Create Account"
#
#     expect(page).to have_content "Please fill in all fields."
#   end
#
#   context "the passwords do not match" do
#     email = "sally@fakeaccount.com"
#     password_1 = "sallyisthebest"
#     password_2 = "sallyistheworst"
#
#     visit new_user_path
#     fill_in "Email", with: email
#     fill_in "Password", with: password_1
#     fill_in "Password confirmation", with: password_2
#     click_on "Create Account"
#
#     expect(page).to have_content "Your passwords do not match exactly. "
#
#   end
end
