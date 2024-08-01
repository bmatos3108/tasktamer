class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :tasks, dependent: :destroy
  has_one_attached :profile_picture
  has_one_attached :shopping_list
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
