class Comic < ApplicationRecord
  validates :title, presence: true
  validates :issue, numericality: { only_integer: true }, presence: true, uniqueness: { scope: :series_id }
  validates :upc, numericality: { only_integer: true, greater_than: 100_000_000_000 }, uniqueness: true, presence: true
  validates :pages, numericality: { only_integer: true, allow_nil: true }
  validates :cover_price, numericality: { allow_nil: true }, format: { with: /\A\d+(?:\.\d{2})?\z/ }

  belongs_to :series
end
