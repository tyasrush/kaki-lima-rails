require 'csv'
require 'elasticsearch/model'

class KakiLima < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  settings do
    mappings dynamic: 'false' do
      indexes :nama
      indexes :lokasi
      indexes :kelurahan
      indexes :kecamatan
      indexes :kabupaten
      indexes :alamat
      indexes :phone
    end
  end

  def as_indexed_json(options={})
    as_json(only: [:id, :nama, :lokasi, :kelurahan, :kecamatan, :kabupaten, :alamat, :phone, :latitude, :longitude])
  end

  def self.import_file(file)
    file_csv = File.new(file.path)
    CSV.foreach(file_csv, headers: true) do |row|
      KakiLima.create!(nama: row['nama_warung'], lokasi: row['lokasi_binaan'], kabupaten: row['kota/kab'], kecamatan: row['kecamatan'], kelurahan: row['kelurahan'], alamat: row['alamat'], lat: row['latitude'], lng: row['longitude'],
      phone: row['no_telepon'], open: row['waktu_buka'], closed: row['waktu_tutup'])
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::CSV.new(file.path, nil, :ignore)
    when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
end

# KakiLima.import
