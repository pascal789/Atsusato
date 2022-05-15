class Genre < ApplicationRecord
  has_many :books, dependent: :destroy
  validates :name, uniqueness: true, presence: true
end
