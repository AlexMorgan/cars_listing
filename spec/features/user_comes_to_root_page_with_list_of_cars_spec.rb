require 'rails_helper'

feature 'user visits home page and sees a list of all manufacturers' do
  scenario 'user sees a list of manufacturers' do
    manufacturers = FactoryGirl.create_list(:manufacturer, 20)
    visit root_path

    manufacturers.each do |m|
      expect(page).to have_content(m.name)
    end
  end
end
