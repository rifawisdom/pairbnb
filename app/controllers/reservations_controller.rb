class ReservationsController < ApplicationController
	
	def index
	end

	def new

		@listing = Listing.find(params[:listing_id])
		@reservation = Reservation.new

	end

	def create
		@listing = Listing.find(params[:listing_id])
		reservation = Reservation.new(reservation_params)	

		reservation.user_id = current_user.id
		reservation.listing_id = params[:listing_id]

		if reservation.save
			# ReservationMailer.reservation_email(current_user, @listing.user_id, reservation.id).deliver_later
			ReservationJob.perform_later(current_user, @listing.user_id, reservation.id)
			# ReservationMailer.reservation_email(current_user, @listing.user_id, reservation.id).deliver_later
			redirect_to reservation_path(reservation.id)
			
		else
			flash[:alert]= "#{reservation.errors.full_messages[0]}"
			redirect_to new_listing_reservation_path(reservation.listing_id)
			
		end
	end

	private
	  def reservation_params
	  	params.require(:reservation).permit(:user_id, :listing_id, :start_date, :end_date)
	  end



end
