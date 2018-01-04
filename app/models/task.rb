class Task < ApplicationRecord

	# checked
  validates :title, presence: true,
	  length: {
	  	minimum: 5,
	  	maximum: 30,
	  	too_long: "Thirty characters is the maximum allowed",
	  	too_short: "Five characters is the minimum allowed"
	  }

  # checked
	validates :description, presence:true

	# checked
  validates :priority, presence: true,
	  numericality: {
	  	only_integer: true,
	  	less_than_or_equal_to: 9999,
	  }

  #checked
  validates :due_date, presence: true

end
