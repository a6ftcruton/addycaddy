class Rating

  attr_reader :address,
              :radius,
              :points

  def initialize(address, radius)
    @address = address
    @radius = radius.to_f
  end

#  def score
#    #results.thisquery.length
#  end
#
#  def best
#    #return the address that has the better score 
#  end

  def criteria_score(results, query)
    points = 0 
    if query == "crimes"
      points = results.send(query.to_sym).length * -3      
    else
      results.send(query.to_sym).map do |result|
        @result_location = [result["location"]["lat"], result["location"]["lng"] ]
        if within_primary_radius? 
          points += 5
        elsif within_secondary_radius?
          points += 3
        else
          points += 1
        end
      end
    end
    points
  end

 def within_primary_radius?
    convert_to_meters(Geocoder::Calculations.distance_between(address, @result_location)) < secondary_radius
  end

  def within_secondary_radius?
    distance = convert_to_meters(Geocoder::Calculations.distance_between(address, @result_location))
    distance > primary_radius && distance  < radius_in_meters
  end
  
  def primary_radius
    (radius_in_meters / 3).round
  end

  def secondary_radius
    secondary = (radius_in_meters / 3).round * 2
  end

  def radius_in_meters
    (radius * 1600).to_i
  end

  def convert_to_meters(distance)
    (distance * 1600).to_i
  end

end
