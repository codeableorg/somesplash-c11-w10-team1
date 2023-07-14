class Photo < ApplicationRecord
  belongs_to :category , counter_cache: true
  belongs_to :commentable, polymorphic: true
  validates :title, presence: true, uniqueness: true
end
