class User < ActiveRecord::Base
  validates :username, presence: true
  validates :email, presence: true
  validates_uniqueness_of :username
  validates_uniqueness_of :email

  has_secure_password
  has_many :trips
  has_many :pictures
  has_many :tags
end
