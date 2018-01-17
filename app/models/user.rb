class User < ActiveRecord::Base

	def full_name
		"#{firstname} #{lastname}"
	end

  has_many :tasks

  has_secure_password

  # attr_accessor :email, :username, :firstname, :lastname, :password_digest

   # validates :username, :email, presence: true
   # validates :password, :password_confirmation, presence: true
end
