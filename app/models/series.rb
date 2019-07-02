class Series < ApplicationRecord
  validates :name, presence: true
  validates :marvel_id, numericality: { only_integer: true, allow_nil: true }

  has_many :comics, dependent: :destroy
end
