class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :event_id
      t.integer :guest_id
      t.integer :stars, default: 0

      t.timestamps null: false
    end
  end
end
