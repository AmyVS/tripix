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

  it "gives a user an error who enters a password that doesn't match their own" do
    visit '/sessions/new'
    user = User.create(:username => 'myname', :email => 'myname@email.com', :password => 'mypassword')
    fill_in :email, :with => 'myname@email.com'
    fill_in :password, :with => 'notmypassword'
    click_button "Enter"
    page.should have_content "Email or password is invalid"
  end
end
