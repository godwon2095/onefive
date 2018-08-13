class CopysController < ApplicationController
  def copy
    @post = Post.find(params[:id])

    respond_to do |format|
      format.js
    end
  end
end
