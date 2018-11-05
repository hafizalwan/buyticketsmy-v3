class RemoveHostFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :is_host
  end
end
