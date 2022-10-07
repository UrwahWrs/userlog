class Blogpost < ApplicationRecord
 
  belongs_to :blogger
  has_many :comments, dependent: :destroy
  has_one_attached :image
  validates :title, presence: true
  validates :category, presence: true
  validates :image, presence: true
  validates :description, presence: true, length: { minimum: 10 }

  scope :active_blogs, -> { where(status: 'public') }
end
