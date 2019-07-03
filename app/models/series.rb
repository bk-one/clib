class Series < ApplicationRecord
  extend FriendlyId

  validates :name, presence: true
  validates :marvel_id, numericality: { only_integer: true, allow_nil: true }

  has_many :comics, -> { order(:issue) }, dependent: :destroy

  friendly_id :name, use: :slugged

  def add_comics(amount)
    highest_issue = comics.last&.issue || 0
    new_issue = highest_issue + 1
    (new_issue..(new_issue+amount-1)).each do |issue|
      comics.create! issue: issue, title: name + " \##{issue}"
    end
  end

  # Let's fake authors for now until we implement this
  def authors
    "Written by: [#{Faker::Name.name}](#) (8 issues), [#{Faker::Name.name}](#) (3 issues), et al."
  end

  def artists
    "Art by: [#{Faker::Name.name}](#) (8 issues), [#{Faker::Name.name}](#) (3 issues), et al."
  end
end
