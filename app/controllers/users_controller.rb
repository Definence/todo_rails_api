class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :create

  def create
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


  private

  def user_params
    params.require(:user).permit(:email, :username, :firstname, :lastname, :password, :password_confirmation)
  end
end
