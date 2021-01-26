class AddUltraFeaturedToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :ultra_featured, :boolean, default: false
  end
end
