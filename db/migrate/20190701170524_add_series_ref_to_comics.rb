class AddSeriesRefToComics < ActiveRecord::Migration[6.0]
  def change
    add_reference :comics, :series, foreign_key: true
  end
end
