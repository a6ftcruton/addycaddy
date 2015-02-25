class CreateLiveMusic < ActiveRecord::Migration
  def change
    create_table :live_musics do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.string :address
    end
  end
end
