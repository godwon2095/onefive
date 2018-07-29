class FollowsController < ApplicationController
    before_action :authenticate_user!
    
    def create
        Follow.create(follower_id: current_user.id,
                       followed_id: params[:followed_id])
        redirect_to :back
    end
    
    def destroy
        Follow.find_by(follower_id: current_user.id,
                       followed_id: params[:id]).destroy
        redirect_to :back
    end
end
