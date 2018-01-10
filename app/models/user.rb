class User < ActiveRecord::Base

  # has_many :tasks

  has_secure_password

  # attr_accessor :email, :username, :firstname, :lastname, :password_digest

   # validates :username, :email, presence: true
   # validates :password, :password_confirmation, presence: true
end
