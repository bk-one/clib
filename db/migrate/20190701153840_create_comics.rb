class CreateComics < ActiveRecord::Migration[6.0]
  def change
    create_table :comics do |t|
      t.string :title
      t.integer :issue
      t.integer :pages
      t.string :dimensions
      t.decimal :cover_price, precision: 3, scale: 2
      t.string :currency
      t.date :cover_date
      t.bigint :upc

      t.timestamps
    end
  end
end
