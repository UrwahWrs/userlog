class Blogpost < ApplicationRecord
 
  paginates_per 6
  belongs_to :blogger, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :image

  validates :title, presence: true
  validates :category, presence: true
  validates :image, presence: true
  validates :description, presence: true, length: { minimum: 10 }
end
