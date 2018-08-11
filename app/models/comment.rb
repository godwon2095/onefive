class Comment < ActiveRecord::Base
  after_create :generate_alarm

  belongs_to :user
  belongs_to :post

  def generate_alarm
    if self.post.user != self.user
      Alarm.create(user_id: self.post.user.id, content: self.user.name, findable_id: self.post.id, is_read: false, alarm_type: "comment")
    end
  end
end
