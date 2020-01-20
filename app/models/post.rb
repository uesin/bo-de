class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  def self.search(search)
    return Post.all unless search
    Post.where('content LIKE(?)', "%#{search}%")
  end
end
