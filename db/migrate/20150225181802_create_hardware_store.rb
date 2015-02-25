class CreateHardwareStore < ActiveRecord::Migration
  def change
    create_table :hardware_stores do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.string :address
    end
  end
end
