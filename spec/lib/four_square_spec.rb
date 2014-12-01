#require 'rails_helper'
#require 'vcr'
#
#describe FourSquare do
#
#  describe 'get request' do
#    it 'returns data on parks near a given address', :vcr do
#      visit comparisons_new_path
#      fill_in :first_address, with: "1550 Blake St Denver, CO"
#      fill_in :second_address, with: "1160 Ogden St Denver, CO"
#      click_on '.general'
#      check :query_parks
#      click_on '#compare'
#      expect(current_path).to eq comparisons_show_path
#      expect(page).to have_content "parks"
#    end
#  end
#
#end
