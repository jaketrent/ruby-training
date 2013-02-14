class CommentsController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    @comment = Comment.create params[:comment]
    @comment.article_id = params[:article_id]

    if @comment.save
      flash[:notify] = "You commented!"
      redirect_to article_path @article
    else
      flash[:notify] = "Invalid comment.  Try again."
      render "articles/show"
    end
  end

end