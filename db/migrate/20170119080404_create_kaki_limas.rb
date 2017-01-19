class CreateKakiLimas < ActiveRecord::Migration[5.0]
  def change
    create_table :kaki_limas do |t|
      t.string :nama
      t.string :lokasi
      t.string :kabupaten
      t.string :kecamatan
      t.string :kelurahan
      t.string :alamat
      t.float :lat
      t.float :lng
      t.string :phone
      t.string :open
      t.string :closed

      t.timestamps
    end
  end
end
