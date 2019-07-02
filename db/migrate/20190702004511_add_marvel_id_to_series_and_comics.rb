class AddMarvelIdToSeriesAndComics < ActiveRecord::Migration[6.0]
  def change
    add_column :series, :marvel_id, :bigint
    add_column :comics, :marvel_id, :bigint
  end
end
