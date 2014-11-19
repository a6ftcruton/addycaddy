class CreateCrimes < ActiveRecord::Migration
  def change
    create_table :crimes do |t|
      t.string :offense_type
      t.float :longitude
      t.float :latitude
      t.string :date
    end
  end
end
