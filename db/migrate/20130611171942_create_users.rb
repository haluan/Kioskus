class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nama
      t.string :email
      t.string :password_digest
      t.string :alamat
      t.string :kota
      t.string :provinsi
      t.string :ingat_aku

      t.timestamps
    end
  end
end
