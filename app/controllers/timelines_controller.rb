class TimelinesController < ApplicationController
    
    def profile
        @posts = Post.where(user_id: params[:id])
    end
    
end