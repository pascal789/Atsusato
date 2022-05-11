class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.integer :book_id
      t.integer :genre_id
      t.string :title
      t.text :introduction

      t.timestamps
    end
  end
end
