class CreateAnimes < ActiveRecord::Migration[6.0]
  def change
    create_table :animes do |t|
      t.string :name, null: false
      t.integer :genre_id, null: false
      t.integer :score
      t.text :memo
      t.references :list, foreign_key: true
      t.timestamps
    end
  end
end
