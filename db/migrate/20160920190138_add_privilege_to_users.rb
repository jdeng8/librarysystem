class AddPrivilegeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :privilege, :integer, :null=>false, :default=> 2
  end
end
