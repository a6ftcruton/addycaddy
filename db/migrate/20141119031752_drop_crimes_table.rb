class DropCrimesTable < ActiveRecord::Migration
  def change
    drop_table :crimes
  end
end
