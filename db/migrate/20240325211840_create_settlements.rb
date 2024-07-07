class CreateSettlements < ActiveRecord::Migration[7.0]
  def change
    create_table :settlements do |t|
      t.string :name
      t.string :size
      t.string :government

      t.timestamps
    end
  end
end
