class Comment < ApplicationRecord
    has_many :comments, as: :commentable
end
