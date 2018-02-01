class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create, :email_confirmation]

  def create
    user = User.new(user_params)
    email_exists = User.find_by(email: user.email)
    if !email_exists
      username_exists = User.find_by(username: user.username)
      if !username_exists
        #присвоєння токена
        user.token = SecureRandom.hex(15)
        #mailer
        if user.save
          #сайт з якого ми прийшли
          origin = request.headers['origin']
          #визиваєм функцію registration_confirmation з класа юзер мейл
          UserMailer.registration_confirmation(user, origin).deliver
          render_api({ message: 'You have successfully signed up. Confirm your email' }, 200)
        else
          render json: User.create(user_params).errors, status: 404
        end
      else
        render_api({ message: 'Username has already been taken' }, 207)
      end
    else
      render_api({ message: 'Email has already been taken' }, 207)
    end
  end

  def email_confirmation
    user = User.find_by_token(params[:user])
    if !user.confirmed
      user.confirmed = true
      if user.save
        render_api({ message: 'You have confirmed your email' }, 200)
      else
        render_api(404)
      end
    else
      render_api({ message: 'Email is already confirmed' }, 200)
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :firstname, :lastname, :password, :password_confirmation)
  end
end
