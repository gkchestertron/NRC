class ContentsController < ApplicationController

	def create
		@content = Content.new(params[:content])
		if current_user.admin && @content.save
			render json: @content 
		else
			render json: @content.errors
		end
	end

	def destroy
		if current_user.admin
			Content.find(params[:id]).destroy
			head :ok
		end
	end

	def show
		@content = Content.find(params[:id])
		render json: @content
	end

	def update
		@content = Content.find(params[:id])
		if current_user.admin && @content.update_attributes(params[:content])
			render json: @content
		else
			render json: @content.errors
		end
	end
end
