class CreateGroceryStores < ActiveRecord::Migration
  def change
    create_table :grocery_stores do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.string :address
    end
  end
end
