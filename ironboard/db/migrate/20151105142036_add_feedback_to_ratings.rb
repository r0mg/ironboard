class AddFeedbackToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :feedback, :string
  end
end
