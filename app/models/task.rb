class Task < ApplicationRecord

	belongs_to :user

  validates :title, presence: true,
	  length: {
	  	minimum: 5,
	  	maximum: 30
	  }

	validates :description, presence:true

  validates :priority, presence: true,
	  numericality: {
	  	only_integer: true,
	  	less_than_or_equal_to: 3,
	  	more_than_or_equal_to: 1
	  }

  validates :due_date, presence: true

end
