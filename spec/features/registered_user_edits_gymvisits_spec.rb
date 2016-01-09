require 'rails_helper'

RSpec.feature "Registered user creates a gym visit" do
  scenario "they see the index with their user page with visit info" do
    user = create(:user_with_gymvisit)
    login_user(user)

    click_on "Edit Visit"
    fill_in "Calories burned", with: 2000
    click_on "Update Visit"

    expect(current_path).to eq user_path(user)
    expect(page).to have_content user.name
    expect(page).to have_content "2000"
  end
end
