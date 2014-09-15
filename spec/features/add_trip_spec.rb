require 'rails_helper'

describe "adding trips" do
  it "creates a new trip on the user's account" do
    visit '/sessions/new'
    user = User.create(:username => 'myname', :email => 'myname@email.com', :password => 'mypassword')
    fill_in :email, :with => 'myname@email.com'
    fill_in :password, :with => 'mypassword'
    click_button "Enter"
    visit '/trips/new'
    save_and_open_page
    fill_in :trip_name, :with => 'my adventure'
    click_button "Create Trip"
    expect(page).to have_content "Your trip has been documented!"
  end

  it "makes sure that a trip name is added before adding it" do
    visit '/sessions/new'
    user = User.create(:username => 'myname', :email => 'myname@email.com', :password => 'mypassword')
    fill_in :email, :with => 'myname@email.com'
    fill_in :password, :with => 'mypassword'
    click_button "Enter"
    visit '/trips/new'
    click_button "Create Trip"
    expect(page).to have_content "Something went wrong. Please try again."
  end
end
