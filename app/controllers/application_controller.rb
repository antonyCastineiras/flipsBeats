class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :active_class, :form_errors_for, :current_order, :current_active_user

	def current_order
		if !current_user
			nil
		else
			session[:order_id].nil? ? Order.new(user_id: current_user.id) : Order.find(session[:order_id])
		end
	end  


  def active_class(controller, action)
  	controller_name == controller && action_name == action ? "active" : ""
  end

  def form_errors_for(object=nil)
  	render partial: 'shared/form_errors', locals: {object: object} unless object.blank?
  end

  def current_active_user
  	current_user || current_admin
  end
end
