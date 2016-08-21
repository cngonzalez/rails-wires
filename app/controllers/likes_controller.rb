class LikesController < ApplicationController

  def index
    @page = Page.find(params[:page_id])
    @likes = Like.where(page_id: params[:page_id])
    render 'pages/likes/index'
  end

  def create
    like = Like.new(like_params)
    if like.save
      notice = "Successfully saved"
      redirect_to page_likes_path(like.page_id)
    end
  end

  def like_params
    params.require(:like).permit(:user_id, :page_id, :comment)
  end

end
