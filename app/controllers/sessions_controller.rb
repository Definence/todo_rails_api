class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: :create

  expose :user, -> { User.find_by(email: session_params[:email].downcase) }

  def create
    # user = User.find_by(email: params[:session][:email].downcase)
    if user
      if user.authenticate(session_params[:password])
        if user.confirmed
          render_api(user, 200, serializer: SessionSerializer)
        else
          render json: { message: 'Confirm your email' }, status: 207
        end
      else
        render json: { message: 'Wrong email or password' }, status: 400
      end
    else
      render json: { message: 'User does not exist' }, status: 204
      # render_api({ message: I18n.t('User does not exist') }, 204)
    end
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
