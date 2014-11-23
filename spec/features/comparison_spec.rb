require 'rails_helper'
require 'capybara/poltergeist'

describe 'user submits comparison' do
  before do
    visit '/comparisons/new'
  end

  context 'with valid first_address' do
    before do
      @address = build(:address).address 
      fill_in 'first_address', with: @address
    end

    it 'uses Crime as default criteria' do
      click_on 'Compare'
      within('.crime-summary') do
        expect(page).to have_content "This year there were 0 crimes within ___ miles of this address." 
      end
    end
  
    it 'returns matching data for first_address' do
      click_on 'Compare'
      expect(current_path).to eq comparisons_show_path
      expect(page).to_not have_css '.alert-box'
      expect(page).to have_content @address
    end

    xit 'returns only data matching selected criteria' do
      click_on 'Compare'
      # what data will be displayed if Parks is selected?
      expect(page).to_not have_content
    end
    

    xit 'returns an error when user manually deselects all criteria' do
      within('.switch.radius') do
        find('input#query_crime').set(value: "0")
      end
      click_on 'Compare'
      expect(current_path).to eq comparisons_new_path
      expect(page).to have_content "You must choose at least one criteria for your comparison."
    end
  end

  context 'with invalid first_address' do
    
    it 'empty first_address field' do
      click_on 'Compare'
      expect(current_path).to eq comparisons_new_path
      expect(page).to have_content "Address cannot be blank."
    end

    it 'does not match accepted area code' do
      fill_in 'first_address', with: "8401 Park Meadows Center Dr Lone Tree, CO 80124"
      click_on 'Compare'
      expect(current_path).to eq comparisons_new_path
      expect(page).to have_content "City must be located in Denver."
    end
  end

end
