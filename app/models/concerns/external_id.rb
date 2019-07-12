require 'active_support/concern'

module ExternalId
  extend ActiveSupport::Concern

  included do
    has_many :external_id_records, as: :entity, dependent: :destroy

    def add_external_id(provider, external_id)
      external_id_records.create! external_id_provider: provider, external_id: external_id
    end

    def external_id(provider)
      external_id_records.find_by(['external_id_provider = ?', provider]).external_id
    end
  end

  class_methods do
    def find_by_external_id(provider, external_id)
      joins(:external_id_records).find_by(
        ['external_id_provider = ? AND external_id_records.external_id = ?', provider, external_id.to_s]
      )
    end
  end
end
