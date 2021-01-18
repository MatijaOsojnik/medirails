class Article < ApplicationRecord
  belongs_to :user
  belongs_to :bookmark
  has_one_attached :photo
  has_rich_text :content
  # acts_as_commontable dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true

  def self.posted
    where('scheduled_for < ? OR scheduled_for IS NULL', DateTime.now)
  end
end
