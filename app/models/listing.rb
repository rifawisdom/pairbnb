class Listing < ApplicationRecord
	belongs_to :user
	mount_uploaders :image, ImageUploader
	has_many :reservations
  
 
  scope :check_title, ->(search_title){ where("name ILIKE ?", "%#{search_title}%")}
	
end
