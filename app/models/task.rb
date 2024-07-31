class Task < ApplicationRecord
  belongs_to :user  # assuming Task belongs to User

  validates :title, presence: true
  validates :due_date, presence: true
end
