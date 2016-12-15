class CreateUserConcerts < ActiveRecord::Migration[5.0]
  def change
    create_table :user_concerts do |t|
      t.integer :user_id
      t.integer :concert_id

      t.timestamps
    end
  end
end
