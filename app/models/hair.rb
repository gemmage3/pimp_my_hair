class Hair < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_one :purchase
  validates :weight_grams, presence: true
  validates :length_cm, presence: true
  validates :price, presence: true
  validates :hair_type, presence: true
  validates :colour, presence: true
  validate :photos_presence_format

  ETHNICITY = ["African", "European", "Russian", "Indian temple", "South Asian", "Peruvian", "Brazilian", "Malaysian", "Burmese", "Mongolian", "Chinese", "Oriental or other"]
  TYPES = ["silky straight", "saki straight", "wavy", "curly", "coily"]
  COLOURS = [ "blonde", "red", "light brown", "medium brown", "dark brown", "black", "white"]

  include PgSearch::Model

  pg_search_scope :global_search,
    against: [ :ethnicity, :weight_grams, :length_cm, :price, :hair_type, :colour ],
    using: {
      tsearch: {any_word: true}
    }

  private

  def photos_presence_format
    if photos.attached? == false
      errors.add(:photos, "required.")
    end
  end

end
