class CreateBCycles < ActiveRecord::Migration
  def change
    create_table :b_cycles do |t|
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
