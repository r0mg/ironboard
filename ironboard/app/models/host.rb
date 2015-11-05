class Host < ActiveRecord::Base

  belongs_to :user
  has_many :events

  include GuestHostMethods
  
end
