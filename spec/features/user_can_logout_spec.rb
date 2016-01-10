require 'rails_helper'

RSpec.feature "User can log out of their account" do
  scenario "they see the login page" do
    login_admin

    expect(current_path).to eq admin_users_path

    click_on "Logout"

    expect(current_path).to eq '/login'
    # expect(:session).to eq nil
  end
end
