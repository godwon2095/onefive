class Alarm < ActiveRecord::Base
  belongs_to :user

  #알람 종류
  enum alarm_type: [:post, :comment, :follow, :like, :tag]
end
