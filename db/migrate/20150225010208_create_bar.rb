class CreateBar < ActiveRecord::Migration
  def change
    create_table :bars do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.string :address
    end
  end
end
