require 'rails_helper'

RSpec.feature "Registered user deletes a gym visit" do
  scenario "they see the index with their user page without visit info" do
    user = create(:user_with_gymvisit)
    login_user(user)

    expect(page).to have_content "01/01/2016"

    click_on "Delete Visit"

    expect(current_path).to eq user_path(user)
    expect(page).to have_content user.name
    expect(page).to_not have_content "01/01/2016"
  end
end
