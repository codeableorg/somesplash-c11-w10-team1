class Category < ApplicationRecord
    has_many :photos, dependent: :destroy
end
