class Blogpost < ApplicationRecord
  belongs_to :blogger
  has_many :comments, dependent: :destroy
  has_one_attached :image

  validate :image_type

private

def image_type
   if image.attached? == false
     errors.add(:image, "is missing!")
   end
   if !image.content_type.in?(%('image/jpeg image/png image/jpg'))
     errors.add(:image, "needs to be a jpeg, jpg or png!")
   end
end
 
  has_many :favorited_by, :through => :favorite_blogposts, source: :blogger 


  validates :title, presence: true,length: { minimum: 5 }
  validates :category, presence: true
  validates :image, presence: true
  validates :description, presence: true, length: { minimum: 10 }

  scope :active_blogs, -> { where(status: 'public') }
end
