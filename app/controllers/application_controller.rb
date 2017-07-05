class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :active_class

  def active_class(controller, action)
  	controller_name == controller && action_name == action ? "active" : ""
  end
end
