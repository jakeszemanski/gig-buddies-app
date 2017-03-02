class AddIdToBandConcert < ActiveRecord::Migration[5.0]
  def change
    add_column :band_concerts, :band_id, :integer
    add_column :band_concerts, :concert_id, :integer
  end
end
