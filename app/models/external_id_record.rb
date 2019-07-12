class ExternalIdRecord < ApplicationRecord
  belongs_to :entity, polymorphic: true
end
