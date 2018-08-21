class Subcomment < ActiveRecord::Base
  after_create :generate_alarm

  belongs_to :user
  belongs_to :post
  belongs_to :comment

  has_many :tags

  def generate_alarm
    if self.comment.user.subcomment_on == true
      if self.user != self.comment.user
        Alarm.create(content: self.user.name, user_id: self.comment.user.id, findable_id: self.post.id, is_read: false, alarm_type: "subcomment")
      end
    end
  end
end
