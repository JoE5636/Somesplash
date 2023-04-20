class Category < ApplicationRecord
    has_many :photos
    has_many :comments, as: :commentable, dependent: :destroy
end
