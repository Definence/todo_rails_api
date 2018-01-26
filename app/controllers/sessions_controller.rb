class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: :create

  expose :user, -> { User.find_by(email: session_params[:email].downcase) }

  def create
    # шукає юзера по імейлу(інпут з бекенду) і назначає в перемінну
    # user = User.find_by(email: params[:session][:email].downcase)
    # перевіряє наявність юзера і перевіряє відповідність паролей
    if user && user.authenticate(session_params[:password])
      # виводить дані на фронтенд
      if user.confirmed
        render_api(user, :ok, serializer: SessionSerializer)
        # замінили на serializer
        # render json: { username: user.username, token: user.token, message: 'Login successfully' }, status: 200
      elsif !user.confirmed
        render json: { message: 'Confirm your email' }, status: 207
      end
    else
      render json: { message: 'Invalid email or password.' }, status: 204
    end
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
