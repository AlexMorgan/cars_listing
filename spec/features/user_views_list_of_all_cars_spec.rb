require 'rails_helper'

feature 'user views a list of all the cars in the listing' do
  scenario 'user sees a list of cars' do
    manufacturer = FactoryGirl.create(:manufacturer)
    car = FactoryGirl.create(:car, manufacturer: manufacturer)

    visit cars_path
    expect(page).to have_content car.color
    expect(page).to have_content car.manufacturer.name
  end
end
