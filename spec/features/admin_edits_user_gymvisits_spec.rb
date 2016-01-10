require 'rails_helper'


RSpec.feature "admin can edit a users gymvisit" do
  scenario "admin sees users show page with updated visit info" do
    user = create(:user_with_gymvisit)
    login_admin
    click_on user.name

    expect(page).to_not have_content "5000"

    click_on "Edit Visit"
    fill_in "Calories burned", with: 5000
    click_on "Update Visit"

    expect(current_path).to eq admin_user_path(user)
    expect(page).to have_content user.name
    expect(page).to have_content "5000"

  end
end
