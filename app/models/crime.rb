require 'date'

class Crime < ActiveRecord::Base
  reverse_geocoded_by :latitude, :longitude

  def self.current_year
    Crime.where('extract(year from date) = ?', 2014)
  end
  
end
