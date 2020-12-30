class Article < ApplicationRecord
  belongs_to :user
  # acts_as_commontable dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true

  def self.posted
    where('scheduled_for < ? OR scheduled_for IS NULL', DateTime.now)
  end
end
