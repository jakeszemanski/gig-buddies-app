class ChangeTimeToStringAndAddDateToConcerts < ActiveRecord::Migration[5.0]
  def change
    change_column :concerts, :doors, :string 
    change_column :concerts, :show, :string
    add_column :concerts, :date, :date
  end
end
