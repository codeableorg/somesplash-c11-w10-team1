class Photo < ApplicationRecord
  # Associations
  belongs_to :category, counter_cache: true
  has_many :comments, as: :commentable
  # Validations
  validates :title, presence: true, uniqueness: true
  has_one_attached :image
end
