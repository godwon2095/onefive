class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :check_ownership!, only: [:destroy]

    def create
        @new_comment = Comment.new(set_comment_params)
        @new_comment.content
        @new_comment.user_id = current_user.id
        @new_comment.post_id = params[:post_id]
        respond_to do |format|
            if @new_comment.save
                @post = @new_comment.post
                format.js
            else
                format.html{ redirect_to :back,
                             notice: "오류가 발생했습니다." }
            end
        end
    end

    def destroy
        @comment.destroy

        respond_to do |format|
          format.js
        end
    end

    private
    def check_ownership!
        @comment = Comment.find_by(id: params[:id])
        redirect_to root_path if current_user.id != @comment.user.id
    end

    def set_comment_params
        params.require(:comment).permit(:content,:image)
    end
end
