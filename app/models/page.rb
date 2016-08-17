class Page < ApplicationRecord
  has_many :likes
  has_many :likers, through: :likes, source: :user
  has_many :elements

  accepts_nested_attributes_for :elements
end
