class SubcommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @subcomment = Subcomment.new(set_params)
    @subcomment.user_id = current_user.id
    respond_to do |format|
        if @subcomment.save
            @post = @subcomment.post
            @comment = @subcomment.comment
            format.js
        else
            format.html{ redirect_to :back,
                         notice: "오류가 발생했습니다." }
        end
    end
  end

  def destroy
    @subcomment = Subcomment.find(params[:id])
    @subcomment.destroy
  end

  private

  def set_params
    params.require(:subcomment).permit(:content, :post_id, :comment_id)
  end
end
