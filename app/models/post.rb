class Post < ActiveRecord::Base
    belongs_to :user
    
    #댓글
    has_many :comments
    
    #좋아요
    has_many :likes
    has_many :liked_users, through: :likes, source: :user
    
    #검색
    searchable do
        string :title
        text :subtitle
        text :content
    end
    mount_uploaders :music_images, PostImageUploader
end
