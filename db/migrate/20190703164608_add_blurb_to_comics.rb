class AddBlurbToComics < ActiveRecord::Migration[6.0]
  def change
    add_column :comics, :blurb, :text
  end
end
