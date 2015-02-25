require 'date'

class Crime < ActiveRecord::Base
  reverse_geocoded_by :latitude, :longitude

  def self.current_year
    Crime.where(date: full_year )
  end

  private
 
  def full_year
    (Date.today - 1.year)..Date.today 
  end
end
