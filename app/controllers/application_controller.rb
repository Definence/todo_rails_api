class ApplicationController < ActionController::API
  before_action :authenticate_user!

  def current_user
    current_user ||= User.find_by(token: request.headers['Authorization'])
  end

  def render_api(object, status = :ok, options = {})
    if object.respond_to?(:errors) && object.errors.present?
      render json: { message: object.errors.full_messages.to_sentence },
             status: :unprocessable_entity
    else
      render({ json: object, status: status }.merge(options))
    end
  end

  private

  def authenticate_user!
    unauthorized! unless current_user
  end

  def unauthorized!
    head :unauthorized
  end
end
