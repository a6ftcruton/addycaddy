class ChangeColumnNamesToLatitutdeAndLongitude < ActiveRecord::Migration
  def change
    rename_column :crimes, :geo_lon, :longitude
    rename_column :crimes, :geo_lat, :latitude
  end
end
