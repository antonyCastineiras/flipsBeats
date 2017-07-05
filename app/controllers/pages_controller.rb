class PagesController < ApplicationController
  def home
  	@new_admin = Admin.new
  end
end
