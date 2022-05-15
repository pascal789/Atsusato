class Book < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :favorite, dependent: :destroy
  has_many :book_comment, dependent: :destroy
  belongs_to :genre

  validates :title,presence:true
  validates :introduction,presence:true,length:{maximum:200}

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search_for(content, method)
    if method == 'perfect'
      Book.where(title: content)
    elsif method == 'forward'
      Book.where('title LIKE ?', content+'%')
    elsif method == 'backward'
      Book.where('title LIKE ?', '%'+content)
    else
      Book.where('title LIKE ?', '%'+content+'%')
    end
  end
end
