class Series < ApplicationRecord
  extend FriendlyId

  validates :name, presence: true
  validates :marvel_id, numericality: { only_integer: true, allow_nil: true }

  has_many :comics, dependent: :destroy

  friendly_id :name, use: :slugged

  # Let's fake authors for now until we implement this
  def authors
    "Written by: [#{Faker::Name.name}](#) (8 issues), [#{Faker::Name.name}](#) (3 issues), et al."
  end

  def artists
    "Art by: [#{Faker::Name.name}](#) (8 issues), [#{Faker::Name.name}](#) (3 issues), et al."
  end
end
