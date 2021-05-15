class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  has_one_attached :thumbnail
  validates_presence_of :content
  validates :thumbnail, presence: true, blob: { content_type: :image }
end
