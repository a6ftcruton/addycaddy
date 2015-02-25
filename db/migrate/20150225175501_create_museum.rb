class CreateMuseum < ActiveRecord::Migration
  def change
    create_table :museums do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.string :address
    end
  end
end
