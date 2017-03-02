class CreateBandConcerts < ActiveRecord::Migration[5.0]
  def change
    create_table :band_concerts do |t|

      t.timestamps
    end
  end
end
