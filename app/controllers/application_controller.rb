class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken

	# Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  skip_before_action :verify_authenticity_token
  # before_action :doorkeeper_authorize!
end
