class Picture < ActiveRecord::Base
  validates :user_id, presence: true
  validates :trip_id, presence: true
end
