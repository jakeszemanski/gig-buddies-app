class AddConcertIdToBands < ActiveRecord::Migration[5.0]
  def change
    add_column :bands, :concert_id, :integer
  end
end
