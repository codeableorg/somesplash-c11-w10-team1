class Photo < ApplicationRecord
  belongs_to :category , counter_cache: true
  validates :title, presence: true, uniqueness: true
end
