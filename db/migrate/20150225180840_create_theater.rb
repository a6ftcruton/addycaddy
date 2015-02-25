class CreateTheater < ActiveRecord::Migration
  def change
    create_table :theaters do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.string :address
    end
  end
end
