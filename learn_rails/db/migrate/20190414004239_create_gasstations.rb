class CreateGasstations < ActiveRecord::Migration[5.2]
  def change
    create_table :gasstations do |t|
      t.float :prices
      t.float :latitudes
      t.float :longitudes
      t.integer :user_id

      t.timestamps
    end
  end
end
