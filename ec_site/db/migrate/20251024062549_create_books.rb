class CreateBooks < ActiveRecord::Migration[8.1]
  def change
    create_table :books do |t|
      t.string :book_name
      t.string :author_name
      t.date :issue_date
      t.boolean :product_display
      t.integer :price
      t.string :status

      t.timestamps
    end
  end
end
