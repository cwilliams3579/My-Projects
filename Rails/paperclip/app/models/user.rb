class User < ApplicationRecord
  has_attached_file :avatar
  validates :name, :description, :avatar, :presence => true
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
