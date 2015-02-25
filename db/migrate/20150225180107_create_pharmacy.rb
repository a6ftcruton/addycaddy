class CreatePharmacy < ActiveRecord::Migration
  def change
    create_table :pharmacies do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.string :address
    end
  end
end
