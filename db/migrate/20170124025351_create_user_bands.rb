class CreateUserBands < ActiveRecord::Migration[5.0]
  def change
    create_table :user_bands do |t|

      t.timestamps
    end
  end
end
