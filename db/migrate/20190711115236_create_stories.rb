class CreateStories < ActiveRecord::Migration[6.0]
  def change
    create_table :stories do |t|
      t.string :title
      t.string :slug
      t.string :code
      t.integer :pages
      t.date :publication_date
      t.text :description

      t.timestamps
    end
  end
end
