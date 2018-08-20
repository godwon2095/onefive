class Tag < ActiveRecord::Base
  after_create :generate_alarm
  after_update :generate_alarm

  belongs_to :user
  belongs_to :comment
  belongs_to :subcomment

  def generate_alarm
    if self.user.tag_on == true
      if self.user != self.comment.user
        alarm = Alarm.create(user_id: self.user.id, content: self.user.name, findable_id: self.comment.post.id, is_read: false, alarm_type: "tag")
      end
    end
  end
end
