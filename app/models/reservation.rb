class Reservation < ApplicationRecord
	belongs_to :user
	belongs_to :listing

	validate :check_overlapping_dates

	before_save :calculate_price

	def check_overlapping_dates 
	 	x = Reservation.where(listing_id: self.listing_id)
		x.each do |r|
		
			if overlaps?(r)
				return errors.add(:dates, "unavailable")
			end
		end
		return true	
	end

	private
	def overlaps?(other)
		self.start_date <= other.end_date && other.start_date <= self.end_date
	end

	def calculate_price
		self.total_price = self.listing.price_per_night*(self.end_date - self.start_date)
	end
end
