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
      # виводить дані на фронтенд
      render json: {
        # user_id: user.id,
        token: token,
        message: 'Login successfully',
        status: 201
      }
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :firstname, :lastname, :password, :password_confirmation, )
  end
end
