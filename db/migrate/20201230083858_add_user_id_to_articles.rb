class AddUserIdToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :user_id, :integer
    # add_index :articles, :user_id
    # add_foreign_key :articles, :users, column: user_id
  end
end
