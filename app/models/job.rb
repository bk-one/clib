class Job < ApplicationRecord
  VALID_JOB_NAMES = %w[
    artist
    cover_artist
    colorist
    editor
    inker
    letterer
    writer
  ].freeze

  belongs_to :person
  belongs_to :creative_work, polymorphic: true

  validates :name, inclusion: { in: VALID_JOB_NAMES }
end
