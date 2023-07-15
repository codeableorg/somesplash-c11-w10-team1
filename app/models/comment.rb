class Comment < ApplicationRecord
    # Associations
    belongs_to :commentable, polymorphic: true
  
    # Validations
    validates :content, presence: true
  end