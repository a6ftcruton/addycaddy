require 'capybara/poltergeist'
include Devise::TestHelpers

describe 'login process' do
    
  before do 
    request.env["devise.mapping"] = Devise.mappings[:user]
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter] 
  end
  
  it 'authenticates a user with twitter'
    
    context 'successful login' do
      
      it "twitter sign in button" do
      end

    end

  end
