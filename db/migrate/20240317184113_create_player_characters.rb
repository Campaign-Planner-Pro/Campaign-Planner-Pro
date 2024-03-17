class CreatePlayerCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :player_characters do |t|
      t.string :name
      t.string :background
      t.references :campaign, null: false, foreign_key: true

      t.timestamps
    end
  end
end
