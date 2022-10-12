class Blogger < ApplicationRecord
   
    
    has_many :blogposts, dependent: :destroy
    has_secure_password
    has_many :favorite_blogposts 
    has_many :favorites, :through => :favorite_blogposts, source: :blogpost # the actual recipes a user favorites

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  # validates :password, presence: true, length: { minimum: 5 }
  # validates :password_confirmation, presence: true, length: { minimum: 5 }
end
