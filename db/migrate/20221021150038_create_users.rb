class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :name
      t.integer :credit
      t.integer :cart
      t.boolean :is_admin

      t.timestamps
    end
  end
end
