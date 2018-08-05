class TimelinesController < ApplicationController

    def profile
        @user = User.find(params[:id])
        @posts = Post.where(user_id: params[:id]).order(created_at: :desc).paginate(:page => params[:page], :per_page => 3)
    end

end
