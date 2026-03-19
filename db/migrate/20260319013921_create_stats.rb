class CreateStats < ActiveRecord::Migration[7.2]
  def change
    create_table :stats do |t|
      t.string :season
      t.integer :games_played
      t.integer :goals
      t.integer :assists
      t.integer :points
      t.integer :plus_minus
      t.references :player, null: false, foreign_key: true

      t.timestamps
    end
  end
end
