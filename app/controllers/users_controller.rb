
class UsersController < ApplicationController
  def login_form
    @user = User.new
  end

  def login
    username = params[:user][:username]
    user = User.find_by(username: username)

    if user 
      session[:user_id] = user.id
      flash[:success] = "Welcome back, #{username}."
    else
      user = User.create(username: username)
      session[:user_id] = user.id
      flash[:success] = "Welcome new user, #{user.username}."
    end
    redirect_to root_path
  end

  def current
    @current_user = User.find_by(id: session[:user_id])
    unless @current_user
      flash.now[:error] = "You must be logged in to see this page"
      redirect_to root_path
    end
  end

  def logout
    session[:user_id] = nil
    # flash[:notice] = "Logged out #{current_user.username}"
    redirect_to root_path
  end

  def upvote
    current_user = User.find_by(id: session[:user_id])

    if current_user
      @work = Work.find_by(id: params[:id])

      if current_user.voted_for? @work
        flash[:warning] = "Cannot upvote the same media twice."
      else
        @work.upvote_by current_user
        flash[:success] = "Successfully voted for #{@work.title}"
        redirect_to work_path(@work.id)
      end

    else
      flash[:danger] = "Must be logged in to vote!"
      redirect_to works_path
    end
    # redirect_back(fallback_location: root_path)

  end
end
