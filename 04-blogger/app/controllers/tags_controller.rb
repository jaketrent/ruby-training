class TagsController < ApplicationController

  def index
    @tags = Tag.order("name")
  end 

  def show
    @tag = Tag.find_by_name(params[:id])
  end

end