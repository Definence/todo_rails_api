class Task < ApplicationRecord

  validates :title, presence: true, length: {
  	minimum: 5,
  	maximum: 30,
  	too_long: "Thirty characters is the maximum allowed",
  	too_short: "Five characters is the minimum allowed"
  }

  validates :priority, presence: true, numericality: { only_integer: true }
  validates :due_date, presence: true

end
