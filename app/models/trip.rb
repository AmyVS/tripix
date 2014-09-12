class Trip < ActiveRecord::Base
  validates :user_id, presence: true
  validates :description, presence: true

end
