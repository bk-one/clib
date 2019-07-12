class CreateExternalIdRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :external_id_records do |t|
      t.string :external_id_provider
      t.string :external_id

      t.references :entity, polymorphic: true, index: true
      t.timestamps
    end
  end
end