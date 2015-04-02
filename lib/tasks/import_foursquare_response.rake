require 'four_square'

namespace :import_foursquare_response do
  include FourSquare
  include Venue

  desc "Load database with results of API calls"
  task :create_records => :environment do
    puts "Loading database..."

    Table        = Struct.new(:table, :category_id)
    tables       = Venue.categories
    center       = "2393 E Alameda Ave Denver CO" 
    radius       = 12000
    result_count = 0

    def venue_categories(data)
      data.map { |k,v| Table.new(k, v) }
    end

    structured_tables = venue_categories(tables)

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
