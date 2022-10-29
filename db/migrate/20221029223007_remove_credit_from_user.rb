class RemoveCreditFromUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :credit, :integer
  end
end
