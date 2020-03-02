class Hair < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_one :purchase
  validates :weight_grams, presence: true
  validates :length_cm, presence: true
  validates :price, presence: true
  validates :hair_type, presence: true
  validates :colour, presence: true
  ETHNICITY = [ "European", "Russian", "Indian Temple", "South Asian Other", "Peruvian", "Brazilian", "Malaysian", "Burmese", "Mongolian", "Chinese", "Oriental-other"]
  TYPES = ["Silky Straight", "Yaki straight", "Wavy", "Curly"]
  COLOURS = [ "Blonde", "Light Brown", "Medium Brown", "Dark Brown", "Black", "White"]

  include PgSearch::Model

  pg_search_scope :global_search,
    against: [ :ethnicity, :weight_grams, :length_cm, :price, :hair_type, :colour ],
    using: {
      tsearch: {any_word: true}
    }

  acts_as_taggable_on :straight
  acts_as_taggable_on :wavy
  acts_as_taggable_on :curly

end
