class LikesController < ApplicationController

  def index
    @like = Like.new
    @page = Page.find(params[:page_id])
    @likes = Like.where(page_id: params[:page_id])
    render 'pages/likes/index'
  end

  def create
    like = Like.new(like_params)
    if like.save
      # notice = "Successfully commented"
      render json: like.to_json(:include => :user), status: 201
    end
  end

  def like_params
    params.require(:like).permit(:user_id, :page_id, :comment)
  end

end
