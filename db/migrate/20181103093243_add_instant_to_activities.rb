class AddInstantToActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :instant, :integer, default: 0
  end
end
