class Hair < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_one :purchase
  validates :weight_grams, presence: true
  validates :length_cm, presence: true
  validates :price, presence: true
  validates :hair_type, presence: true
  validates :colour, presence: true
end
