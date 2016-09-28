class ChangePrivilegeInUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :privilege,:string, :default => 'Member'
  end
end
