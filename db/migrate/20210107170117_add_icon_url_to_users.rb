class AddIconUrlToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :icon_url, :string
  end
end
