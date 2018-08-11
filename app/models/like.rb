class Like < ActiveRecord::Base
    after_create :generate_alarm

    belongs_to :user
    belongs_to :post

    def generate_alarm
      if Alarm.find_by(user_id: self.post.user.id, alarm_type: 3).nil? && self.post.user != self.user
        if self.post.user.like_on == true
          Alarm.create(user_id: self.post.user.id, content: self.user.name, findable_id: self.post.id, is_read: false, alarm_type: "like")
        end
      end
    end
end
