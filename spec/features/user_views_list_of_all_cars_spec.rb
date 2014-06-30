require 'rails_helper'

feature 'user views a list of all the cars in the listing' do
  scenario 'user sees a list of cars' do
    manufacturer = FactoryGirl.create(:manufacturer)
    cars = FactoryGirl.create_list(:car, 30, manufacturer: manufacturer)

    visit cars_path

    cars.each do |car|
      expect(page).to have_content car.manufacturer
      expect(page).to have_content car.color
    end
  end
end
