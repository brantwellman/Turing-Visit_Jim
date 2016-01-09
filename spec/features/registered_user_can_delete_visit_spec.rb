# require 'rails_helper'
#
# RSpec.feature "Registered user deletes a gym visit" do
#   scenario "they see the index with their user page without visit info" do
#
#     user = create(:user_with_gymvisits)
#     login_user
#
#     click_on "Delete Visit"
#
#     expect(current_path).to eq user_path(user)
#     expect(page).to have_content user.name
#     expect(page).to have_content "2000"
#   end
# end
