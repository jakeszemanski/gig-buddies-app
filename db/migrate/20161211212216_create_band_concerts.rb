class CreateBandConcerts < ActiveRecord::Migration[5.0]
  def change
    create_table :band_concerts do |t|
      t.integer :band_id
      t.integer :concert_id

      t.timestamps
    end
  end
end
