class RemoveAdminFromUsers < ActiveRecord::Migration[6.1]
  def self.up
    remove_column :users, :admin
  end

  def self.down
    add_column :users, :admin, :boolean, default: false
  end
end
