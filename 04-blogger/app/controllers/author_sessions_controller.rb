class AuthorSessionsController < ApplicationController

  def new
  end

  def create
    username = params[:username]
    password = params[:password]
    if login username, password
      redirect_back_or_to root_path, notify: "Logged in"
    else
      flash[:notify] = "Login failed"
      render :new
    end
  end

  def destroy
    flash[:notify] = "Logged out"
    logout
    redirect_to root_path
  end

end