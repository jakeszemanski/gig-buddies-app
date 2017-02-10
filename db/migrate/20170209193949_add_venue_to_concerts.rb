class AddVenueToConcerts < ActiveRecord::Migration[5.0]
  def change
    add_column :concerts, :venue, :string
  end
end
