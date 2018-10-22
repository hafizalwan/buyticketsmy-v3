class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :name
      t.text :description
      t.text :price_details
      t.text :how_to_directions
      t.text :how_to_seats
      t.text :activity_info
      t.text :refund_policies
      t.string :location_title
      t.string :location_map
      t.integer :my_adult_price, default: 0
      t.integer :my_child_price, default: 0
      t.integer :int_adult_price, default: 0
      t.integer :int_child_price, default: 0
      t.integer :price, default: 0
      t.boolean :is_int_price, default: false
      t.integer :full_price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
