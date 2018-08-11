class Follow < ActiveRecord::Base
  after_create :generate_alarm

  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  def generate_alarm
    if Alarm.find_by(user_id: self.followed.id, alarm_type: 2).nil?
      Alarm.create(user_id: self.followed.id, content: self.follower.name, findable_id: self.follower.id, is_read: false, alarm_type: "follow")
    end
  end
end
