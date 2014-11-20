require 'csv'
require 'net/http'

namespace :csv_importer do

  desc "Write updated crime data to Crimes table"
  task :write_crimes_data => :environment do

    uri      = URI('http://data.denvergov.org/download/gis/crime/csv/crime.csv')
    csv_text = Net::HTTP.get(uri)
    
    File.open('public/crime_data.csv', 'w+') { |file| file.write(csv_text) }

    CSV.foreach('public/crime_data.csv', headers: true, header_converters: :symbol) do |row|
      crime = Crime.find_or_create_by(
        :offense_type => row[:offense_type_id],
        :longitude => row[:geo_lon].to_f,
        :latitude => row[:geo_lat].to_f,
        :date => row[:reported_date]
       )
    end
  end
end
