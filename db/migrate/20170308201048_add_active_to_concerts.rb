class AddActiveToConcerts < ActiveRecord::Migration[5.0]
  def change
    add_column :concerts, :active, :boolean, :default => true
  end
end
