class Blogpost < ApplicationRecord
  belongs_to :blogger
  has_many :comments, dependent: :destroy
  has_one_attached :image
  validates :image, presence: true, format: { with: %r{\.(gif|jpg|png|jpeg)\Z}i, message: 'must be a GIF, JPG or PNG image.'}

 
  has_many :favorited_by, :through => :favorite_blogposts, source: :blogger # the actual users favoriting a recipe


  validates :title, presence: true,length: { minimum: 5 }
  validates :category, presence: true
  validates :image, presence: true
  validates :description, presence: true, length: { minimum: 10 }

  scope :active_blogs, -> { where(status: 'public') }
end
