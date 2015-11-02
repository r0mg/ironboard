class CreateRsvps < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|
    	t.integer :event_id
    	t.integer :guest_id
    end
  end
end
