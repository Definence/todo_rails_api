class UsersController < ApplicationController
  def index
  end

  def new
  	# @user = User.new(user_params)

  	# if @user.save
   #    render json: @user, status: :created, location: @user
   #  else
   #    render json: @user.errors, status: :unprocessable_entity
   #  end
  end

  def create
    user = User.new(user_params)

  #   redirect_to tasks_path
		user.token = SecureRandom.hex(15)


  	if user.save
      #сайт з якого ми прийшли
  		origin = request.headers['origin']
      #визиваєм функцію registration_confirmation з класа юзер мейл
      UserMailer.registration_confirmation(user, origin).deliver
      #render :show, status: :ok
  		# p '*************'

  	else
    	render json: User.create(user_params).errors, status: 404
  	end
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :firstname, :lastname, :password, :password_confirmation, )
  end
end
