class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.datetime :arrival
      t.integer :my_adult_count, default: 0
      t.integer :my_child_count, default: 0
      t.integer :int_adult_count, default: 0
      t.integer :int_child_count, default: 0
      t.integer :total, default: 0
      t.references :user, foreign_key: true
      t.references :activity, foreign_key: true

      t.timestamps
    end
  end
end
