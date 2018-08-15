class Comment < ActiveRecord::Base
  after_create :generate_alarm

  #유저 태그 기능
  after_create do
    hashtags = self.content.scan(/@\w+/)
    hashtags.uniq.map do |hashtag|
      if User.find_by(name: hashtag.delete('@')).present?
        user = User.find_by(name: hashtag.delete('@'))
        tag = Tag.find_or_create_by(name: hashtag.delete('@'),
                                    user_id: user.id)
      end
    end
  end

  before_update do
    user.tags.clear # We delete all and add again
    hashtags = self.content.scan(/@\w+/)
    hashtags.uniq.map do |hashtag|
      if User.find_by(name: hashtag.delete('@')).present?
        user = User.find_by(name: hashtag.delete('@'))
        tag = Tag.find_or_create_by(name: hashtag.delete('@'),
                                    user_id: user.id)
      end
    end
  end

  belongs_to :user
  belongs_to :post

  def generate_alarm
    if self.post.user != self.user
      if self.post.user.comment_on == true
        Alarm.create(user_id: self.post.user.id, content: self.user.name, findable_id: self.post.id, is_read: false, alarm_type: "comment")
      end
    end
  end
end
