require 'rails_helper'

describe "adding trips" do
  it "creates a new trip on the user's account" do
    visit '/sessions/new'
    user = User.create(:username => 'myname', :email => 'myname@email.com', :password => 'mypassword')
    fill_in :email, :with => 'myname@email.com'
    fill_in :password, :with => 'mypassword'
    click_button "Enter"
    visit '/trips/new'
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

  it "edits a trip on the user's account" do
    visit '/sessions/new'
    user = User.create(:username => 'myname', :email => 'myname@email.com', :password => 'mypassword')
    fill_in :email, :with => 'myname@email.com'
    fill_in :password, :with => 'mypassword'
    click_button "Enter"
    trip = Trip.create(:name => 'my adventure', :user_id => user.id)
    click_link("#{user.username}")
    click_link('edit')
    fill_in :trip_name, :with => 'my AWESOME adventure'
    click_button "Update Trip"
    expect(page).to have_content "Your trip has been edited."
  end

  it "makes sure that a trip name is not blank before editing it" do
    visit '/sessions/new'
    user = User.create(:username => 'myname', :email => 'myname@email.com', :password => 'mypassword')
    fill_in :email, :with => 'myname@email.com'
    fill_in :password, :with => 'mypassword'
    click_button "Enter"
    trip = Trip.create(:name => 'my adventure', :user_id => user.id)
    click_link("#{user.username}")
    click_link('edit')
    click_button "Update Trip"
    expect(page).to have_content "Your trip has been edited."
  end
end
