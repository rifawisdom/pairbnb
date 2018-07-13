class ListingsController < ApplicationController
	before_action :require_login, only:[:new, :create]
	# before_action :check_update_rights, only:[:edit, :update]
	before_action :check_verification_rights, only:[:verify]


	def index
 		@listing = Listing.page(params[:page]).per(10)
	end

	def create
	    listing = Listing.new(listing_params)	
	  
	    listing.user_id = current_user.id
	   	
	   listing.save

	   redirect_to root_path
	   
	end
	
	def edit
		@listing = Listing.find(params[:id])
	end
	
	def show
		@listing = Listing.find(params[:id])


	end

	def new
		@listing = Listing.new
	end

	def verify
		@listing = Listing.find(params[:id])

		if @listing.verified == true 
			@listing.update(verified: false)
		else 
			@listing.update(verified: true)
		end

		if@listing.save
			redirect_to listing_path(@listing)
		end

	end

	def update
		l = Listing.find(params[:id])
		
		l.image = params[:listing][:image] 
		
		l.save
		
	end

	private
	  def listing_params
	  	params.require(:listing).permit(:name, :property_type, :description, :guest_number, :room_number, :bath_number, :price_per_night, :country, :state, :city, :zipcode, :address, :user_id, {image: []})
	  	
	  end

	def check_update_rights
		@listing = Listing.find(params[:id])
		if current_user.id != @listing.user_id && !current_user.superadmin?
			redirect_to root_path
		end
	end

	def check_verification_rights
		if !current_user.moderator?
		flash[:error] = "You do not have access to this page!"
			redirect_to root_path
		end

	end


end


			# if user.customer?
	  #       flash[:notice] = "Sorry. You are not allowed to perform this action."
	  #       return redirect_to root_path, notice: "Sorry. You do not have the permissino to verify a property."
	  #     end
