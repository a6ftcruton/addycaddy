class CreateArtGallery < ActiveRecord::Migration
  def change
    create_table :art_galleries do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.string :address
    end
  end
end
