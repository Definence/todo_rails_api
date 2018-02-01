class User < ActiveRecord::Base

	def full_name
		"#{firstname} #{lastname}"
	end

  has_many :tasks

  has_secure_password

  validates :email, uniqueness: { scope: :email, message: "Has already been taken" }
  validates :username, uniqueness: { scope: :username, message: "Has already been taken" }
  # validates :lastname,  presence: true, length: { minimum: 4, too_short: "Your last name can not consist of less than four letters"}
  # validates :firstname, presence: true, length: { minimum: 3, too_short: "Your first name can not consist of less than three letters"}
  # validates :firstname, :lastname, format: { with: /\A[a-zA-Z]+\z/,
  #   :message => "Only letters allowed" }
  # validates :password, :password_confirmation, presence: true
end
