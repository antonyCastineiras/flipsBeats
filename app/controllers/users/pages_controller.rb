class Users::PagesController < ApplicationController
	def purchased_tracks
		@user = current_user
		@purchased_tracks = @user.purchased_tracks
	end 
end