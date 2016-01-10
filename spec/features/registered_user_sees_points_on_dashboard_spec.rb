require 'rails_helper'

RSpec.feature "Registered user can see points on dashboard" do
  scenario "they start with 0 points" do
    user = create(:user)
    login_user(user)

    expect(page).to have_content("Total Points: 0")
    expect(page).to have_content("Redeemable Points: 0")
    expect(page).to have_content("Used Points: 0")
  end

  scenario "they see their edited points after points are assigned" do
    user = create(:user)
    login_admin
    click_on user.name
    click_on "Assign Points"
    fill_in "Redeemable points", with: 100
    click_on "Submit Points"

    click_on "Logout"
    login_user(user)

    expect(page).to have_content("Total Points: 100")
    expect(page).to have_content("Redeemable Points: 100")
    expect(page).to have_content("Used Points: 0")
  end
end
