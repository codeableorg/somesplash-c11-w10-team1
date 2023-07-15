class Photo < ApplicationRecord
  belongs_to :category , counter_cache: true
  # belongs_to :commentable, polymorphic: true
  # has_many :comments , as: :commentable, dependent: :destroy
  validates :title, presence: true, uniqueness: true

  has_one_attached :image
end
