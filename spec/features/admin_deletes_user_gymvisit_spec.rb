require 'rails_helper'


RSpec.feature "admin can delete a users gymvisit" do
  scenario "admin sees users show page without visit info" do
    user = create(:user_with_gymvisit)
    login_admin
    click_on user.name

    expect(page).to have_content "01/01/2016"

    click_on "Delete Visit"

    expect(current_path).to eq admin_user_path(user)
    expect(page).to have_content user.name
    expect(page).to_not have_content "01/01/2016"

  end
end
