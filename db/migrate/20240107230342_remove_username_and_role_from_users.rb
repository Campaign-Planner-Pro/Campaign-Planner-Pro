class RemoveUsernameAndRoleFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :username, :string
    remove_column :users, :role, :string
  end
end
