class UsersController < ApplicationController
	def create
		@user = User.new(params[:user])
		if @user.save
			login!(@user)
			redirect_to root_url
		else
			flash[:errors] = @user.errors.full_messages
		end
	end

	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
		render json: @user
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(params[:user])
			render json: @user
		else
			render json: @user.errors
		end
	end
end
