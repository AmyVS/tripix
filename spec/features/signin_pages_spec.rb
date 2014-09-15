require 'rails_helper'

describe "the signin process" do
  it "signs a user in who uses the same password they created with us" do
    visit '/sessions/new'
    user = User.create(:username => 'myname', :email => 'myname@email.com', :password => 'mypassword')
    fill_in :email, :with => 'myname@email.com'
    fill_in :password, :with => 'mypassword'
    click_button "Enter"
    page.should have_content "Logged in!"
  end
end
