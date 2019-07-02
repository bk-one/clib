class Comic < ApplicationRecord
  validates :title, presence: true
  validates :issue, numericality: { only_integer: true }, presence: true, uniqueness: { scope: :series_id }
  validates :upc, numericality: { only_integer: true, greater_than: 100_000_000_000, allow_nil: true }, uniqueness: { allow_blank: true }
  validates :marvel_id, numericality: { only_integer: true, allow_nil: true }
  validates :pages, numericality: { only_integer: true, allow_nil: true }
  validates :cover_price, numericality: { allow_nil: true }, format: { with: /\A\d+(?:\.\d{2})?\z/ }

  belongs_to :series

  has_one_attached :front_cover
  has_one_attached :back_cover

  def cover_filename
    series.name + '-issue-' + issue.to_s
  end
end
