class CreateInterestPoints < ActiveRecord::Migration[7.0]
  def change
    create_table :interest_points do |t|
      t.string :name
      t.references :interestable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
