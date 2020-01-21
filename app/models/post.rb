class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

    def self.search(search)
      if search
        Post.where('content LIKE(?)', "%#{search}%")&& Post.where('title LIKE(?)', "%#{search}%")
      
      else
        Tweet.all
      end
    end
  end
