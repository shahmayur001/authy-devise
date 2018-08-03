class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :valid_two_factor_confirmation
end



def valid_two_factor_confirmation
	if !current_user.authy_enabled
		redirect_to user_enable_authy_path
	end
end





