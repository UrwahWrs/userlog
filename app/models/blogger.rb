class Blogger < ApplicationRecord
   
    has_secure_password
    
    has_many :blogposts, dependent: :destroy
    has_secure_password
    has_many :favorite_blogposts 
    has_many :favorites, :through => :favorite_blogposts, source: :blogpost 
    
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "must be a valid email address" }
 
end
