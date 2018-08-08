class Post < ActiveRecord::Base
    belongs_to :user

    #댓글
    has_many :comments

    #좋아요
    has_many :likes
    has_many :liked_users, through: :likes, source: :user

    # Post.search([object HTMLSpanElement][object HTMLSpanElement][object HTMLSpanElement] [object HTMLSpanElement][object HTMLSpanElement])
    def self.search(query)
        self.where("title || content LIKE ?","%#{query}%")
    end
    
    mount_uploader :image, PostImageUploader
end
