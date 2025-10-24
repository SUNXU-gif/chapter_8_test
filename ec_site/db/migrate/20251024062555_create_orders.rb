class CreateOrders < ActiveRecord::Migration[8.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :quantity
      t.integer :total
      t.string :delivery_address

      t.timestamps
    end
  end
end
