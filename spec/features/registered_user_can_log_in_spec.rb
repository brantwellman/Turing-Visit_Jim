require 'rails_helper'

RSpec.feature "Registered users can log into their account" do
  scenario "regular users see the dashboard for their account" do
    user = create(:user)

    visit login_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Login"

    expect(page).to have_content user.name
    # add something unique for the show page here, like some CSS expectation once we get there. This would technically pass even if it loaded the user index or something if all we test for is the name existing.
  end

  scenario "admin user sees the dashboard for all regular users" do
    user_1, user_2 = create_list(:user, 2)

    login_admin

    expect(current_path).to eq admin_users_path
    expect(page).to have_content user_1.name
    expect(page).to have_content user_2.name
  end

  context "they leave the name field blank" do
    scenario "they see an error message" do
      user = create(:user)

      visit login_path
      fill_in "Password", with: user.password
      click_button "Login"

      expect(page).to have_content "Invalid email or password."
    end
  end

  context "they leave the password field blank" do
    scenario "they see an error message" do
      user = create(:user)

      visit login_path
      fill_in "Email", with: user.password
      click_button "Login"

      expect(page).to have_content "Invalid email or password."
    end
  end

  context "the username and password do not match" do
    scenario "they see an error message" do
      user = create(:user)

      visit login_path
      fill_in "Email", with: user.email
      fill_in "Password", with: "sallyistheworst"
      click_button "Login"

      expect(page).to have_content "Invalid email or password."
    end
  end

end
