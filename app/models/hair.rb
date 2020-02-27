class Hair < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_one :purchase
  validates :weight, presence: true
  validates :length, presence: true
  validates :price_per_gram, presence: true
  validates :hair_type, presence: true
  validates :colour, presence: true
end
