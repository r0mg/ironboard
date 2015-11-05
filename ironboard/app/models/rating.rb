class Rating < ActiveRecord::Base
  belongs_to :guest
  belongs_to :event
end
