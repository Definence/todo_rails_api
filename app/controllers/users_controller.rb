class UsersController < ApplicationController

  def sign_up
    user = User.new(user_params)
    #присвоєння токена
		user.token = SecureRandom.hex(15)
    #mailer
  	if user.save
      #сайт з якого ми прийшли
  		origin = request.headers['origin']
      #визиваєм функцію registration_confirmation з класа юзер мейл
      UserMailer.registration_confirmation(user, origin).deliver
      #render :show, status: :ok
  	else
    	render json: User.create(user_params).errors, status: 404
  	end
  end

  def sign_in
    # шукає юзера по імейлу(інпут з бекенду) і назначає в перемінну
    user = User.find_by(email: params[:session][:email].downcase)
    # перевіряє наявність юзера і перевіряє відповідність паролей
    if user && user.authenticate(params[:session][:password])
      token = user.token
      username = user.username
      confirmed = user.confirmed

      # виводить дані на фронтенд

      if confirmed
        render json: {
        username: username,
        token: token,
        message: 'Login successfully',
        status: 201
        }
      else
        render json: {
        username: username,
        token: token,
        message: 'Confirm your email',
        status: 207
        }
      end

    else
      render json: {
        token: 'guest',
        message: 'Login failed',
        status: 500
      }
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :firstname, :lastname, :password, :password_confirmation, )
  end
end
