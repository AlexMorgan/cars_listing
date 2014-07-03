require 'rails_helper'

feature 'User adds a manufacturer to the listing site' do
  scenario 'User successfully adds a manufacturer' do
    manufacturer = FactoryGirl.build(:manufacturer)

    visit new_manufacturer_path

    fill_in "Name", with: manufacturer.name
    fill_in "Country", with: manufacturer.country
    click_button "Add Manufacturer"

    expect(page).to have_content('Manufacturer added!')
    expect(page).to have_content(manufacturer.name)
  end

  scenario 'User does not successfully fill out the manufacturer form' do
    manufacturer = FactoryGirl.build(:manufacturer)

    visit new_manufacturer_path

    fill_in "Name", with: manufacturer.name
    click_button "Add Manufacturer"

    expect(page).to have_content("There were errors in your submission")
  end

  scenario 'User adds a manufacturer already in the database' do
    # add spec here
  end
end
