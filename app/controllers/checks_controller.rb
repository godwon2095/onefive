class ChecksController < ApplicationController
  def identity
    if User.find_by(identity: params[:identity]).present?
      @result = "이미 같은 아이디가 존재합니다."
    else
      @result = "사용 할 수 있는 아이디 입니다."
    end

    render json: {result: @result}
  end
end
