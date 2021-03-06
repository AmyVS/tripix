class Picture < ActiveRecord::Base
  validates :user_id, presence: true

  belongs_to :user
  belongs_to :trip
  has_many :tags

  validates :photo, :attachment_presence => true
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
