class Task < ApplicationRecord

  validates :title, presence: true, length: { minimum: 5, too_short: "Five characters is the minimum allowed" }
  validates :priority, presence: true, numericality: { only_integer: true }
  validates :due_date, presence: true

end
