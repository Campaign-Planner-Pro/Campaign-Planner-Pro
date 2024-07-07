class AddAtmosphereToSettlements < ActiveRecord::Migration[7.0]
  def change
    add_column :settlements, :atmosphere, :string
  end
end
