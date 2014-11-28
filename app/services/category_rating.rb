class CriteriaRating

  attr_reader :address,
              :radius,
              :primary_radius,
              :secondary_radius,
              :tertiary_radius

  def initialize(address, radius)
    @address = address
    @radius = radius.to_f
  end

  def rating(results)
    points = 0 
    results.parks.map do |result|
      @result_location = [result["location"]["lat"], result["location"]["lng"] ]
      if within_primary_radius? 
        points += 5
       elsif within_secondary_radius?
        points += 3
      else
        points += 1
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
