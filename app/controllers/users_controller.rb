class UsersController < ApplicationController
  def login_form
    @user = User.new
  end

  def login
    username = params[:user][:username]
    user = User.find_by(username: username)

    if user 
      session[:user_id] = @user.id
      flash[:success] = "Welcome back, #{username}."
      redirect_to root_path
    else
      user = User.create(username: username)
      session[:user_id] = user.id
      flash[:success] = "Welcome new user, #{user.username}."
      redirect_to root_path
    end
  end

  def current
    @user = User.find_by(id: session[:user_id])
    unless @user
      flash[:error] = "You must be logged in to see this page"
      redirect_to root_path
    end
  end

  def log_out
    session[:user_id] = nil
    redirect_to root_path
  end
end
