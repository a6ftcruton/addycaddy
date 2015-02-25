require 'csv'
require 'net/http'

namespace :import_denvergov_csv do

  desc "Write updated crime data to Crimes table"
  task :write_crimes_data => :environment do
    puts "Processing..."

      uri      = URI('http://data.denvergov.org/download/gis/crime/csv/crime.csv')
      csv_text = Net::HTTP.get(uri)

    File.open('public/crime_data.csv', 'w+') { |file| file.write(csv_text) }
    
    CSV.foreach('public/crime_data.csv', headers: true, header_converters: :symbol) do |row|
      #get rid of Crime scope in model if this works
      #also try delete_if on csv rows
      if row[:reported_date] > (Date.today - 1.year).to_s
        crime = Crime.find_or_create_by(
          offense_type: row[:offense_type_id],
          longitude:    row[:geo_lon].to_f,
          latitude:     row[:geo_lat].to_f,
          date:         row[:reported_date]
        )
        sleep 0.2 
      end
    end
  end

  desc "Write b_cycle data to BCycle table"
  task :write_b_cycle_data => :environment do
    puts "Processing..."

      uri      = URI('http://data.denvergov.org/download/gis/b_cycle_stations/csv/b_cycle_stations.csv')
      csv_text = Net::HTTP.get(uri)

  File.open('public/b_cycle_data.csv', 'w+') { |file| file.write(csv_text) }
    
    CSV.foreach('public/b_cycle_data.csv', headers: true, header_converters: :symbol) do |row|
      station = BCycle.find_or_create_by(
        name:    row[:station_name],
        address: row[:station_address]
       )
       sleep 0.2 
       puts station
    end
  end

end
