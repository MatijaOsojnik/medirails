class AddUsersToBookmarks < ActiveRecord::Migration[6.1]
  def change
    add_column :bookmarks, :user_id, :integer
  end
end
