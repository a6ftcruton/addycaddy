class CreateCoffeeShop < ActiveRecord::Migration
  def change
    create_table :coffee_shops do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.string :address
    end
  end
end
