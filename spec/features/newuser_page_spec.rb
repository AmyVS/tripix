require 'rails_helper'

describe "new user page" do
  it "creates a brand new user" do
    visit 'signup'
    fill_in :user_username, :with => 'me'
    fill_in :user_email, :with => 'myname@email.com'
    fill_in :user_password, :with => 'mypassword'
    fill_in :user_password_confirmation, :with => 'mypassword'
    click_button "Sign Up"
    expect(page).to have_content "Thanks for signing up!"
  end
end
