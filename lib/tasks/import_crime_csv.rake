require 'csv'

namespace :csv_importer do

  desc "Write updated crime data to Crimes table"
  task :write_crimes_data do
    
    csv_path = 'crime_test.csv'

    CSV.foreach(csv_path, headers: true) do |row|
      Crime.create!(
        :offense_type => row['OFFENSE_CODE'],
        :longitude => row['GEO_LON'],
        :latitude => row['GEO_LAT'],
        :date => row['REPORTED_DATE']
       )
    end
  end
end
