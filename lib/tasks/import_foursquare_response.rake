require 'four_square'

namespace :import_foursquare_response do
  include FourSquare

  desc "Load database with results of API calls"
  task :create_records => :environment do
    puts "Loading database..."

    category_id = "4bf58dd8d48988d163941735"
    results = FourSquare.all_denver_results(category_id)["response"]["venues"]
    total = 0

    results.each do |result|
      Park.find_or_create_by(
        name: result["name"],
        latitude: result["location"]["lat"].to_f,
        longitude: result["location"]["lng"].to_f
      )
      sleep 0.2
      total += 1
      puts "#{total} results added."
    end
    #for each result, create a record and save it to appropriate table
  end
end

# FourSquare.all_denver_results(table, category_id)["response"]["venues"]
#   table.find_or_creat_by <- where 'table' is the model name?
#
#   then create a rake task that runs for each model relying on these api calls
