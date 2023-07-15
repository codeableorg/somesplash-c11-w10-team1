class Category < ApplicationRecord
    # belongs_to :commentable, polymorphic: true
    has_many :comments, as: :commentable, dependent: :destroy
    has_many :photos, dependent: :destroy
    validates :name, presence: true, uniqueness: true
end
