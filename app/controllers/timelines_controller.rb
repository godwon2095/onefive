class TimelinesController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_timeline, only: [:profile, :subscribe]

  def index
    @posts = Post.where(user_id: current_user.followings && current_user).order(created_at: :desc).paginate(:page => params[:page], :per_page => 3)
  end

  def profile
  end

  def subscribe
  end

  private
  def set_timeline
    @user = User.find(params[:id])
    @posts = Post.where(user_id: params[:id]).order(created_at: :desc).paginate(:page => params[:page], :per_page => 3)
  end
end
