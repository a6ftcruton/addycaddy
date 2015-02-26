require 'four_square'

namespace :fetch_foursquare_data do
  include FourSquare

  desc "Load database with results of API calls"
  task :create_records => :environment do
    puts "Loading database..."

    center = "2393 E Alameda Ave Denver CO" 
    radius = 12000
    result_count = 0

    Table = Struct.new(:table, :category_id)
    tables = { 
      "Park": "4bf58dd8d48988d163941735",
      "GroceryStore": "4bf58dd8d48988d118951735",
      "Library": "4bf58dd8d48988d12f941735",
      "Restaurant": "4d4b7105d754a06374d81259",
      "Bar":"4bf58dd8d48988d11b941735,4bf58dd8d48988d121941735,4bf58dd8d48988d118941735" 
    }

    def impose_struct(data)
      data.map { |k,v| Table.new(k, v) }
    end

    structured_tables = impose_struct(tables)
    structured_tables.each do |tbl|
      results = FourSquare.all_denver_results(center, radius, tbl.category_id)["response"]["venues"]
      results.each do |result|
        table_name = tbl.table.to_s.constantize
        table_name.find_or_create_by(
          name: result["name"],
          latitude: result["location"]["lat"].to_f,
          longitude: result["location"]["lng"].to_f
        )
      end
    end

  end
end
