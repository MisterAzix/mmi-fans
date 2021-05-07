class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  
  has_one_attached :thumbnail
  validates_presence_of :content
end
