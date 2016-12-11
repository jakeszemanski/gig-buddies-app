class CreateConcerts < ActiveRecord::Migration[5.0]
  def change
    create_table :concerts do |t|
      t.date :date
      t.time :door
      t.time :show
      t.integer :band_id
      t.integer :venue_id

      t.timestamps
    end
  end
end
