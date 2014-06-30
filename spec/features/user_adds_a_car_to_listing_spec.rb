require 'rails_helper'

feature 'User adds a car to the listing' do
  scenario 'User successfuly adds a car to the site listing' do
    manufacturer = FactoryGirl.create(:manufacturer)
    car = FactoryGirl.build(:car, manufacturer: manufacturer)

    visit manufacturer_path(manufacturer)
    click_link "Add Car"

    fill_in "Color", with: car.color
    fill_in "Year", with: car.year
    fill_in "Mileage", with: car.mileage
    fill_in "Description", with: car.description
    click_button "Add Car"

    expect(page).to have_content('Car has been added!')
    expect(page).to have_content(car.name)
  end

  scenario 'User fails to complete the form correctly' do
    manufacturer = FactoryGirl.create(:manufacturer)
    car = FactoryGirl.build(:car, manufacturer: manufacturer)

    visit manufacturer_path(manufacturer)
    click_link "Add Car"

    fill_in "Color", with: car.color
    fill_in "Year", with: car.year
    click_button "Add Car"

    expect(page).to have_content('There were errors in your submission')
  end
end
