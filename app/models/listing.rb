class Listing < ApplicationRecord
	belongs_to :user
	mount_uploaders :image, ImageUploader
	has_many :reservations
  
 
  
	
end
