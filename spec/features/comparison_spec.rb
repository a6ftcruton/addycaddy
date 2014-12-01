require 'rails_helper'
require 'capybara/poltergeist'

describe 'user submits comparison' do
  before do
    visit '/comparisons/new'
  end

  context 'with valid addresses' do
    before do
      @address = build(:address).address 
      fill_in 'first_address', with: @address
      fill_in 'second_address', with: "1550 Blake St. Denver, CO" 
    end

    it 'returns total count of crimes' do
      find(:css, '#park-button').set(true)
      expect(page).to have_css('#compare')
      page.click_on('#compare')
#      find('input#compare').click
      expect(page).to_not have_css('.alert-box')
      expect(current_path).to eq('/comparisons/show')
      expect(page).to have_css('.first-address-parks')
    end

    xit 'shows crime details when user clicks crime heading' do
    end
  
    xit 'returns matching data for first_address' do
      click_on 'COMPARE'
      expect(current_path).to eq comparisons_show_path
      expect(page).to_not have_css '.alert-box'
      expect(page).to have_content @address
    end

    xit 'returns only data matching selected criteria' do
      click_on 'COMPARE'
      expect(page).to_not have_content
    end
    

    xit 'returns an error when no criteria is selected' do
      click_on 'COMPARE'
      expect(current_path).to eq comparisons_new_path
      expect(page).to have_content "You must choose at least one criteria for your comparison."
    end
  end

  context 'with invalid first_address' do
    
    xit 'empty first_address field' do
      click_on 'COMPARE'
      expect(current_path).to eq comparisons_new_path
      expect(page).to have_content "Address cannot be blank."
    end

    xit 'does not match accepted area code' do
      fill_in 'first_address', with: "8401 Park Meadows Center Dr Lone Tree, CO 80124"
      click_on 'COMPARE'
      expect(current_path).to eq comparisons_new_path
      expect(page).to have_content "City must be located in Denver."
    end
  end

end
