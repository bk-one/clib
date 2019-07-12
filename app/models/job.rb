class Job < ApplicationRecord
  VALID_JOB_NAMES = %I[
    artist
    cover_artist
    colorist
    editor
    inker
    letterer
    writer
  ].freeze

  belongs_to :person
  belongs_to :creative_work, polymorphic: true, dependent: :destroy

  validates :name, inclusion: { in: VALID_JOB_NAMES }
end
