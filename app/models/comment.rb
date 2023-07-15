class Comment < ApplicationRecord
    # Associations
    belongs_to :commentable, polymorphic: true
  
    # Validations
    validates :comment, presence: true
  end
