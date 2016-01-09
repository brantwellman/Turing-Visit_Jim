require 'rails_helper'

RSpec.feature "Registered user creates a gym visit" do
  scenario "they see the index with their user page with visit info" do
    login_user
    user = User.last

    click_on "Record New Visit"
    fill_in "Date", with: "01/01/2015"
    fill_in "Calories burned", with: 1500
    click_on "Record Visit"

    expect(current_path).to eq user_path(user)
    expect(page).to have_content user.name
    expect(page).to have_content "1500"
  end
end
