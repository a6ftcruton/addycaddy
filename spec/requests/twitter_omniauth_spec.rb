require 'rails_helper'
require 'support/omniauth_support'
include OmniauthSupport

RSpec.describe 'twitter omniauth', :type=> :request do

  before do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      :provider => 'twitter',
      :uid => '123545'
    })
  end

  it 'logs in with twitter oauth credentials' do
    expect @user 
    get '/users/auth/twitter/callback'
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter] 
    expect(response.status).to eq(302)
    expect(current_user.uid).to eq '123545'
  end
end
