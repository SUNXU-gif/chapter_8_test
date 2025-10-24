class Book < ApplicationRecord
  has_one_attached :image
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
end
