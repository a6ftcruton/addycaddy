class AddColumnsToCrime < ActiveRecord::Migration
  def change
    add_column :crimes, :incident_id, :integer
    add_column :crimes, :offense_id, :integer
    add_column :crimes, :offense_code, :integer
    add_column :crimes, :offense_code_extension, :integer
    add_column :crimes, :offense_type_id, :integer
    add_column :crimes, :offense_category_id, :string
    add_column :crimes, :first_occurrence_date, :string
    add_column :crimes, :last_occurrence_date, :string
    add_column :crimes, :reported_date, :string
    add_column :crimes, :incident_address, :string
    add_column :crimes, :geo_x, :string
    add_column :crimes, :geo_y, :string
    add_column :crimes, :geo_lon, :float
    add_column :crimes, :geo_lat, :float
    add_column :crimes, :district_id, :string
    add_column :crimes, :precinct_id, :string
    add_column :crimes, :neighborhood_id, :string
    add_column :crimes, :is_crime, :integer
    add_column :crimes, :is_traffic, :integer
  end
end
