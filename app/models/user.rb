class User < ActiveRecord::Base

	def full_name
		"#{firstname} #{lastname}"
	end

  has_many :tasks

  accepts_nested_attributes_for :tasks

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :lastname,  presence: true, length: { minimum: 4 }
  validates :firstname, presence: true, length: { minimum: 3 }
  validates :firstname, :lastname, format: { with: /\A[a-zA-Z]+\z/,
    :message => "Only letters allowed" }
  validates :password, :password_confirmation, presence: true, length: { minimum: 6 }
end
