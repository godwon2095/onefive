class LikesController < ApplicationController
     before_action :authenticate_user!
    
    def like_toggle
        like = Like.find_by(user_id: current_user.id,
                            post_id: params[:post_id])
        if like
            like.destroy
        else
            Like.create(user_id: current_user.id,
                        post_id: params[:post_id])
        end
        
        redirect_to :back
    end
end
