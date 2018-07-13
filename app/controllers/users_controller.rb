class UsersController < Clearance::UsersController

	
	  def show
	  end

	  def edit
	  	@user= User.find(params[:id])

	  end

	  def update
	  	
	    u = current_user
		u.avatar = params[:user][:avatar] 
		
		u.save
	  end

	  def user_params
	  params.require(:user).permit(:email, :password, :first_name, :last_name, :avatar)
	  end



	def create
	    @user = User.new(user_params)	

	    if @user.save
	      sign_in @user
	      redirect_to sign_in_path
	    else
	      render template: "users/new"
	    end
	end


   #  def user_from_params
	  #   email = user_params.delete(:email)
	  #   password = user_params.delete(:password)
	  #   first_name = user_params.delete(:first_name)
	  #   last_name = user_params.delete(:last_name)

	  #   Clearance.configuration.user_model.new(user_params).tap do |user|
	  #     user.email = email
	  #     user.password = password
	  #     user.first_name = first_name
	  #     user.last_name = last_name
	  #   end
  	# end



end