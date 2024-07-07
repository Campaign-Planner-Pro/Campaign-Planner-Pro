class AddRegionsToSettlements < ActiveRecord::Migration[7.0]
  def change
    add_reference :settlements, :region, null: false, foreign_key: true
  end
end
