class Like < ApplicationRecord
  validates :blogger_id, uniqueness: {scope: :post_id}
  belongs_to :blogger
  belongs_to :blogpost
end
