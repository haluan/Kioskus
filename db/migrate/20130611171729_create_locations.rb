class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :nama
      t.string :jalan
      t.string :kota
      t.string :provinsi
      t.float :latitude
      t.float :longitude
      t.boolean :gmaps

      t.timestamps
    end
  end
end
