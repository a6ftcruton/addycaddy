class CreateLightRailStop < ActiveRecord::Migration
  def change
    create_table :light_rail_stops do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.string :address
    end
  end
end
