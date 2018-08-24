class User < ActiveRecord::Base
  # before_save :skip_confirmation!, if: :development?

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  validate :password_complexity
  validates :password, length: { minimum: 8 }, unless: "password.nil?"
  validates_uniqueness_of :name
  validates_uniqueness_of :identity

  #포스팅
  has_many :posts

  #댓글
  has_many :comments

  #대댓글
  has_many :subcomments

  #알람
  has_many :alarms

  #좋아요
  has_many :likes
  has_many :liked_posts, through: :likes, source: :post

  #팔로우
  has_many :follower_relations, foreign_key: "followed_id", class_name: "Follow"
  has_many :followers, through: :follower_relations, source: :follower
  has_many :following_relations, foreign_key: "follower_id", class_name: "Follow"
  has_many :followings, through: :following_relations, source: :followed

  #태그
  has_one :tag

  mount_uploader :thumbnail, ImageUploader

  def development?
    Rails.env.development?
  end

  def is_like?(post)
    Like.find_by(user_id: self.id,
                 post_id: post.id).present?
  end

  def is_follower?(user)
    self.followings.include?(user)
  end

  def self.search(query)
    self.where("name || identity LIKE ?","%#{query}%")
  end

  def self.find_posts
    Post.where(user_id: self.ids)
  end

  def password_complexity
    return if password.blank? || password =~ /^(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,15}$/
     errors.add :password, '비밀번호를 더 복잡하게 설정해주세요!(숫자, 특수문자 포함. 8자 이상)'
  end
end
