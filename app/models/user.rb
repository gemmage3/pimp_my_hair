class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :hairs

  validates :name, presence: true
  validates :address, presence: true
  #validates :city, presence: true
  validates :country, presence: true
  #validates :zip_code, presence: true
  validates :avatar, presence: true
end
