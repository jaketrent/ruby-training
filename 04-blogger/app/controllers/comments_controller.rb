class CommentsController < ApplicationController

  def create
    article_id = params[:article_id]
    comment_params = params[:comment].merge({ article_id: article_id })
    Comment.create comment_params
    redirect_to article_path article_id
  end

end