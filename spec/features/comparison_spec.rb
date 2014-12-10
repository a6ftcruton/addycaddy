require 'rails_helper'

describe 'user submits comparison', js:true do
  before do
    visit '/comparisons/new'
  end

  context 'with valid addresses' do
    before do
      @address = build(:address).address 
      fill_in 'first_address', with: @address
      fill_in 'second_address', with: @address 
    end

    it 'returns total count of parks' do
      page.click_on 'General'
      expect(page).to have_content('PARKS')
      find('label', text: 'PARKS').click
      page.click_on('COMPARE')
      expect(page).to_not have_css('.alert-box')
      expect(current_path).to eq('/comparisons/show')
      expect(page).to have_css('a.first-address-parks')
    end

    it 'shows crime details when user clicks crime heading' do
      page.click_on 'General'
      find('label', text: 'SAFETY').click
      page.click_on('COMPARE')
      expect(page).to have_css('a.first-address-crimes')
      expect(page).to have_css('a.second-address-crimes')
      expect(page).to_not have_css('table.large-10')
      page.find('.second-address-crimes').click
      expect(page).to have_css('table.large-10')
    end
  
    it 'returns data for 2 addresses' do
      page.click_on 'General'
      find('label', text: 'SAFETY').click
      click_on 'COMPARE'
      expect(current_path).to eq comparisons_show_path
      expect(page).to_not have_css '.alert-box'
      expect(page).to have_css('a.first-address-crimes')
      expect(page).to have_css('a.second-address-crimes')
    end

    it 'returns only data matching selected criteria' do
      page.click_on 'General'
      find('label', text: 'PARKS').click
      click_on 'COMPARE'
      expect(page).to have_content('Parks')
      expect(page).to_not have_content('Crimes')
    end

    it 'returns an error when no criteria is selected' do
      page.click_on 'COMPARE'
      expect(current_path).to eq comparisons_new_path
      expect(page).to have_content "You must choose at least one criteria for your comparison."
    end

    it 'user can change search radius' do

    end
  end

  context 'with invalid first_address' do
    
    it 'empty first_address field' do
      fill_in :first_address, with: " " 
      click_on 'COMPARE'
      expect(current_path).to eq comparisons_new_path
      expect(page).to have_content "Address cannot be blank."
    end

    it 'address not in Denver' do
      fill_in 'first_address', with: "205 Dubose Dr Kinston, NC"
      click_on 'COMPARE'
      expect(current_path).to eq comparisons_new_path
      expect(page).to have_content "City must be located in Denver."
    end
  end

end
