class TracksController < ApplicationController
	def new
		@track = Track.new
	end

	def create
		@track = Track.new(track_params)
		@track.admin = current_admin
		if @track.save
		else
			flash[:errors] = "Unable to create track"
		end 
		redirect_to after_create_path
	end

	private

	def after_create_path
		new_track_path
	end

	def track_params
		params.require(:track).permit(:name, :price)
	end
end
