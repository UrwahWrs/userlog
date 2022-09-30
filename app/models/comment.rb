class Comment < ApplicationRecord
    belongs_to :blogpost, dependent: :destroy
end
