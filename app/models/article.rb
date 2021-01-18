class Article < ApplicationRecord
  belongs_to :user
  has_many :bookmarks
  has_one_attached :photo
  has_rich_text :content

  def bookmarked?(user)
    !!self.bookmarks.find{|bookmark| bookmark.user_id == user.id}
  end
    # acts_as_commontable dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true

  def self.posted
    where('scheduled_for < ? OR scheduled_for IS NULL', DateTime.now)
  end
end
