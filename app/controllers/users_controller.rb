class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create, :email_confirmation]

  expose :user, -> { User.find_by_token(params[:user]) }

  def create
    user = User.new(user_params)
    # вивід помилок моделі
    # p user.valid?
    # p user.errors.messages
    # render_api({ message: user.errors.messages }, 207)
    # or
    # render json: { errors: user.errors.messages }, status: 404

    if user.password === user.password_confirmation
      email_exists = User.find_by(email: user.email)
      if !email_exists
        username_exists = User.find_by(username: user.username)
        if !username_exists
          #присвоєння токена
          user.token = SecureRandom.hex(15)
          #mailer
          if user.save
            render_api({ message: 'You have successfully signed up. Confirm your email' }, 200)
            #сайт з якого ми прийшли
            origin = request.headers['origin']
            #визиваєм функцію registration_confirmation з класа юзер мейл
            UserMailer.registration_confirmation(user, origin).deliver
          else
            render json: User.create(user_params).errors, status: 404
          end
        else
          render_api({ message: 'Username has already been taken' }, 207)
        end
      else
        render_api({ message: 'Email has already been taken' }, 207)
      end
    else
      render_api({ message: 'Passwords do not match' }, 207)
    end
  end

  def email_confirmation
    return render_api({ message: 'Email is already confirmed' }, 200) if user && user.confirmed
    return render_api({ message: 'You have confirmed your email' }, 200) if user && user.update_column(:confirmed, true)
    render_api(404)
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :firstname, :lastname, :password, :password_confirmation)
  end
end
