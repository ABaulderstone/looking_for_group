class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :title
      t.text :description
      t.string :location
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.integer :capacity

      t.timestamps
    end
  end
end
