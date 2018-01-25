class ApplicationController < ActionController::API
	before_action :authenticate_user!

  def current_user
    current_user ||= User.find_by(token: request.headers['Authorization'])
  end

	private

	def authenticate_user!
		nauthorized! unless current_user
	end

	def unauthorized!
		head :unauthorized
	end
end
