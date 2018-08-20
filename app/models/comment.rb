class Comment < ActiveRecord::Base
  after_create :generate_alarm
  serialize :content, JSON

  #유저 태그 기능
  after_create do
    hashtags = self.content.scan(/@\w+/)
    hashtags.uniq.map do |hashtag|
      if User.find_by(name: hashtag.delete('@')).present?
        user = User.find_by(name: hashtag.delete('@'))
        tag = Tag.find_by(name: hashtag.delete('@'),
                          user_id: user.id,
                          comment_id: self.id)
        if tag.nil?
          Tag.create(name: hashtag.delete('@'),
                     user_id: user.id,
                     comment_id: self.id)
        else
          tag.update(name: hashtag.delete('@'),
                     user_id: user.id,
                     comment_id: self.id)
        end
      end
    end
  end

  belongs_to :user
  belongs_to :post

  has_many :tags
  has_many :subcomments, dependent: :destroy

  def generate_alarm
    if self.post.user != self.user
      if self.post.user.comment_on == true
        Alarm.create(user_id: self.post.user.id, content: self.user.name, findable_id: self.post.id, is_read: false, alarm_type: "comment")
      end
    end
  end
end
