class CreateParks < ActiveRecord::Migration
  def change
    create_table :parks do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
    end
  end
end
