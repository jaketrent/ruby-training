class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  def new
    @article = Article.new
  end

  def create
    # ! on ActiveRecord obj means raise exception (don't fail quietly)
    @article = Article.create params[:article]

    if @article.valid?
      flash[:notify] = "You're amazing.  Created new article '#{@article.title}'."
      redirect_to article_path @article
    else
      flash[:notify] = "Failed article validation.  Try again."
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update_attributes params[:article]
    @article.save
    flash[:notify] = "You're fantastic.  Updated article '#{@article.title}'."
    redirect_to article_path @article
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notify] = "You're awesome.  Deleted article '#{@article.title}'."
    redirect_to articles_path
  end

end