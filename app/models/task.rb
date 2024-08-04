class Task < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  has_many :notes, dependent: :destroy
  has_many :reminders, dependent: :destroy
end
