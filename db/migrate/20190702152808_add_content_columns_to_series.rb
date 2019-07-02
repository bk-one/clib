class AddContentColumnsToSeries < ActiveRecord::Migration[6.0]
  def change
    change_table :series do |t|
      t.text :abstract
      t.text :description
    end
  end
end
