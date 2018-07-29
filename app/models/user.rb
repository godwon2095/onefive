class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  #포스팅
  has_many :posts
  
  #댓글
  has_many :comments
  
  #팔로우
  has_many :follower_relations, foreign_key: "followed_id", class_name: "Follow"
  has_many :followers, through: :follower_relations, source: :follower
  has_many :following_relation, foreign_key: "follower_id", class_name: "Follow"
  has_many :followings, through: :following_relation, source: :followed
  
  mount_uploader :thumbnail, ImageUploader
  
  def is_like?(post)
    Like.find_by(user_id: self.id,
                 post_id: post.id).present?
  end
end
