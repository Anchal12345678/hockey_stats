class CreatePlayers < ActiveRecord::Migration[7.2]
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.string :position
      t.string :nationality
      t.date :date_of_birth
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
