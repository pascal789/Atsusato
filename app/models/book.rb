class Book < ApplicationRecord
  has_one_attached :image
  
  has_many :favorite, dependent: :destroy  
  has_many :book_comment, dependent: :destroy
end
