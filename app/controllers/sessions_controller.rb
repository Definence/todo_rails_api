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
          render_api({ message: 'Confirm your email' }, 207)
        end
      else
        render_api({ message: 'Wrong email or password' }, 207)
      end
    else
      render_api({ message: 'User does not exist' }, 207)
    end
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
