class Category < ApplicationRecord
    has_many :photos
    has_many :comments, as: :commentable, dependent: :destroy

    validates :name, presence: true, uniqueness: true, length:{ in: 1..25 }
    validates :description, length:{in: 25..200}, allow_blank: true
end
