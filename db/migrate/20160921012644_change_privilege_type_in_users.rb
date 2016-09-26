class ChangePrivilegeTypeInUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :privilege, :string
  end
end
