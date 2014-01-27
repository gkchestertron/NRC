class PagesController < ApplicationController
	def create
		@page = Page.new(params[:page])
		if @page.save
			render json: @page
		else
			render json: @page.errors
		end
	end

	def index
		@pages = Page.all
		render :index
	end

	def show
		@page = Page.find(params[:id])
		render json: @page
	end
end
