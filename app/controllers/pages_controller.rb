class PagesController < ApplicationController
  def home
  	@tracks = Admin.first.tracks
  	@order_item = current_order.order_items.new if current_order
  end

  def admin
  	@new_admin = Admin.new
  end
end
