class LikesController < ApplicationController

  def create
    like = Like.new(like_params)
    if like.save
      notice = "Like successfully saved"
      redirect_to page_path(like.page_id)
    end
    byebug
  end

  def like_params
    params.require(:like).permit(:user_id, :page_id)
  end

end
