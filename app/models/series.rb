class Series < ApplicationRecord
  validates :name, presence: true

  has_many :comics, dependent: :destroy
end
