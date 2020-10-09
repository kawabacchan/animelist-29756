class CreateFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :follows do |t|
      t.integer :friend_id, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
