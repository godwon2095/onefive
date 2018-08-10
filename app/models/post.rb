class Post < ActiveRecord::Base
  after_create :generate_alarms

  belongs_to :user

  #댓글
  has_many :comments

  #좋아요
  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  mount_uploader :image, PostImageUploader

  # Post.search([object HTMLSpanElement][object HTMLSpanElement][object HTMLSpanElement] [object HTMLSpanElement][object HTMLSpanElement])
  def self.search(query)
      self.where("title || content LIKE ?","%#{query}%")
  end

  def generate_alarms
    if self.user.followers.present?
      self.user.followers.each do |follower|
        Alarm.create(user_id: follower.id, content: self.user.name, findable_id: self.id, is_read: false, alarm_type: "post")
      end
    end
  end
end
