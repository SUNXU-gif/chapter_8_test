class CreateAdmins < ActiveRecord::Migration[8.1]
  def change
    create_table :admins do |t|
      t.string :email
      t.string :password

      t.timestamps
    end
    add_index :admins, :email
  end
end
