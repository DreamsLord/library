class Book < ApplicationRecord
  validates :name, :author, presence: true
  validates :name, :author, :category, length: { in: 1..255 }
  validates :description, length: { in: 25..6000 }
end
