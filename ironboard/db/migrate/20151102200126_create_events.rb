class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.string :title
    	t.date :day
    	t.time :start_time
    	t.time :end_time
    	t.integer :host_id
    	t.string :description
    end
  end
end
