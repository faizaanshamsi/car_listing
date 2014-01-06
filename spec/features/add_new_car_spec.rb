require 'spec_helper'

feature 'add a new car', %q{
  As a salesperson
  I want to record a newly acquired car
  So that I can list it in my lot
} do
  # Acceptance Criteria:

  # I must specify the color, year, mileage of the car.
  # Only years from 1980 and above can be specified.
  # I can optionally specify a description of the car.
  # If I enter all of the required information in the required format, the car is recorded.
  # If I do not specify all of the required information in the required formats, the car is not recorded and I am presented with errors.
  # Upon successfully creating a car, I am redirected so that I can create another car

  context 'I specify all the correct information' do
    it 'creates a new car' do
      count = Car.all.count
      visit new_car_path

      fill_in "Color", with: 'blue'
      fill_in "Year", with: 1982
      fill_in "Mileage", with: 202124
      fill_in "Description", with: "Much vroom. So car. Such fast."
      click_on "Create New Car"

      expect(Car.all.count).to eql(count + 1)
      current_path.should eq(new_car_path)
      expect(page).to have_content "Create a New Car"
    end
  end

  context 'I specify incorrect information' do
    it 'should not allow required fields to be blank' do
      visit new_car_path
      click_on "Create New Car"

      expect(page).to have_content "Color is too short (minimum is 1 characters)"
      expect(page).to have_content "Year is not a number"
      expect(page).to have_content "Mileage is not a number"
    end
  end
end
