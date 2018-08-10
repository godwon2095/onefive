class AlarmsController < ApplicationController
  before_action :authenticate_user!
  after_action :read_it, only: [:index]

  def index
    @alarms = Alarm.where(user_id: current_user).order(created_at: :desc)
  end

  def destroy
    @alarm = Alarm.find(params[:id])
    @alarm.destroy
    @alarms = Alarm.where(user_id: current_user).size

    respond_to do |format|
      format.js
    end
  end

  private
  def read_it
    @alarms.each do |alarm|
      alarm.update(is_read: true)
    end
  end
end
