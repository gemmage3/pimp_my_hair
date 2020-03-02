class Hair < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_one :purchase
  validates :weight_grams, presence: true
  validates :length_cm, presence: true
  validates :price, presence: true
  validates :hair_type, presence: true
  validates :colour, presence: true
  ETHNICITY = [ "Caucasian", "Asian", "African"]
  TYPES = [ "straight", "wavy", "curly", "coily" ]
  COLOURS = [ "blond", "red", "brown", "white", "gray"]

  include PgSearch::Model

  pg_search_scope :global_search,
    against: [ :ethnicity, :weight_grams, :length_cm, :price, :hair_type, :colour ],
    using: {
      tsearch: {any_word: true}
    }
  $ethnicity = [ "Caucasian", "Asian", "African"]
  $types = [ "straight", "wavy", "curly", "coily" ]
  $colours = [ "blond", "red", "brown", "white", "gray"]

  acts_as_taggable_on :straight
  acts_as_taggable_on :wavy
  acts_as_taggable_on :curly
  acts_as_taggable_on :coily

end
