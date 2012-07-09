class ApplicationController < ActionController::Base

	check_authorization :unless => :devise_controller?

	protect_from_forgery

	before_filter :last_updated_editions

	def last_updated_editions
		@last_updated_editions = Edition.order("updated_at desc").limit(10)
	end

	rescue_from CanCan::AccessDenied do |exception|
		redirect_to root_path, alert: exception.message
	end

end
