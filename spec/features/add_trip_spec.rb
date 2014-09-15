require 'rails_helper'

include Warden::Test::Helpers

describe "adding trips" do
  it "creates a new trip on the user's account" do
    user = User.create(:username => 'myname', :email => 'myname@email.com', :password => 'mypassword')
    login_as(user, :scope => :user)
    visit '/trips/new'
    save_and_open_page
    fill_in "name", :with => 'my adventure'
    click_button "Create Trip"
    page.should have_content "Your trip has been documented!"
  end
end
