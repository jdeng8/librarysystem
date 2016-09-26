class AddUserIdToNothing < ActiveRecord::Migration[5.0]
  def change
    add_column :nothings, :user_id, :integer
    add_column :users, :name, :string
    add_column :users, :privilege, :integer
  end
end
