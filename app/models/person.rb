class Person < ApplicationRecord
  include ExternalId

  has_many :jobs, dependent: :destroy
  has_many :comics, through: :jobs
end
