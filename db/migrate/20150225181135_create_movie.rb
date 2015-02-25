class CreateMovie < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.string :address
    end
  end
end
