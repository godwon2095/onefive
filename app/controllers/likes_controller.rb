class LikesController < ApplicationController
     before_action :authenticate_user!

    def like_toggle
        like = Like.find_by(user_id: current_user.id,
                            post_id: params[:post_id])
        if like.present?
            like.destroy
        else
            Like.create(user_id: current_user.id,
                        post_id: params[:post_id])
        end

        @post = Post.find(params[:post_id])

        respond_to do |format|
          format.js
        end
    end
end
