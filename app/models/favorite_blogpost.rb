class FavoriteBlogpost < ApplicationRecord
    belongs_to :blogger
    belongs_to :blogpost
end
