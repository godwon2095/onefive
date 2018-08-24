class Tag < ActiveRecord::Base
  after_create :generate_alarm
  after_update :generate_alarm

  belongs_to :user
  belongs_to :comment
  belongs_to :subcomment

  def generate_alarm
    if self.user.tag_on == true
      if self.user != self.comment.user
        self.comment.content.scan(/@\w+/).map do |object|
          if User.find_by(name: object.delete('@')).present?
            alarm = Alarm.create(user_id: User.find_by(name: object.delete('@')).id, content: self.comment.user.name, findable_id: self.comment.post.id, is_read: false, alarm_type: "tag")
          end
        end
      end
    end
  end
end
