class AddAdminToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_admin, :boolean, default: false
    add_column :users, :is_host, :boolean, default: false
  end
end
