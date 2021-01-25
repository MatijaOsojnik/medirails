class Article < ApplicationRecord
  belongs_to :user
  has_many :bookmarks
  has_many :likes
  has_one_attached :photo
  has_rich_text :content

  # acts_as_commontable dependent: :destroy

  validates :photo, presence: true, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 0..2.megabytes }

  def bookmarked?(user)
    !!self.bookmarks.find{|bookmark| bookmark.user_id == user.id}
  end

  def liked?(user)
    !!self.likes.find{|like| like.user_id == user.id}
  end

  validates :title, presence: true
  validates :content, presence: true

  def self.posted
    where('scheduled_for < ? OR scheduled_for IS NULL', DateTime.now)
  end
end
