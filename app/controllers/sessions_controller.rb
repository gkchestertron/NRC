class SessionsController < ApplicationController
	def create
		@user = User.find_by_credentials(*params[:user].values)
		if @user
			login!(@user)
			redirect_to root_url
		else	
			render :new
		end
	end

	def destroy
		logout!
	end

	def new
	end
end
