class Comment < ApplicationRecord
    # belongs_to :blogger
    belongs_to :blogpost
    belongs_to :parent, class_name: "Comment", optional: true
    has_many   :replies, class_name: 'Comment', foreign_key: :parent_id, dependent: :destroy

    validates :body, presence: true,length: { minimum: 2 } 
end
