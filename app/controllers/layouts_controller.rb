class LayoutsController < ApplicationController
	def create
		@layout = Layout.new(params[:layout])
		if @layout.save
			render json: @layout
		else
			render json: @layout.errors
		end
	end

	def destroy
		Layout.Find(params[:id]).destroy
		head :ok
	end

	def update
		@layout = Layout.find(params[:id])
		if @layout.update_attributes(params[:layout])
			render json: @layout
		else
			render json: @layout.errors
		end
	end
end
