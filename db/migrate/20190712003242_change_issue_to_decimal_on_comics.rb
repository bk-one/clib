class ChangeIssueToDecimalOnComics < ActiveRecord::Migration[6.0]
  def change
    change_column :comics, :issue, :decimal, precision: 4, scale: 1
  end
end
