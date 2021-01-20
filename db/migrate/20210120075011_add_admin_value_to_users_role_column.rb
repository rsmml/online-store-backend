class AddAdminValueToUsersRoleColumn < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :role, :string, default: 'admin'
  end
end
