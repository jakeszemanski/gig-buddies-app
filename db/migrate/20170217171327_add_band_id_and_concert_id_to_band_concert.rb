class AddBandIdAndConcertIdToBandConcert < ActiveRecord::Migration[5.0]
  def change
    add_column :band_concerts, :band_id, :string
    add_column :band_concerts, :concert_id, :string
  end
end
