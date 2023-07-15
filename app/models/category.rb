class Category < ApplicationRecord
    # Associations
    has_many :comments, as: :commentable
    has_many :photos, dependent: :destroy
  
    # Validations
    validates :name, presence: true, uniqueness: true
    validates :cover, presence: true
    has_one_attached :cover
  end
  
