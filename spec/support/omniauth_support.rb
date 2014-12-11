require 'omniauth'

module OmniauthSupport
  def set_omniauth(opts = {})
    default = { :provider => :twitter,
                :uuid     => "1234",
                :twitter => {
                  :info => {
                    :nickname => "johnqpublic",
                    :name => "John Q Public",
                    :location => "Anytown, USA",
                    :image => "http://si0.twimg.com/sticky/default_profile_images/default_profile_2_normal.png",
                    :description => "a very normal guy."              
                  } 
                }
              }

    credentials = default.merge(opts)
    provider = credentials[:provider]
    user_hash = credentials[provider]

    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[provider] = {
      'uid' => credentials[:uuid],
      "extra" => {
      "user_hash" => {
        "email" => user_hash[:email],
        "first_name" => user_hash[:first_name],
        "last_name" => user_hash[:last_name],
        "gender" => user_hash[:gender]
        }
      }
    }
  end

  def set_invalid_omniauth(opts = {})

    credentials = { :provider => :twitter,
                    :invalid  => :invalid_crendentials
                  }.merge(opts)

    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[credentials[:provider]] = credentials[:invalid]
  end
end
