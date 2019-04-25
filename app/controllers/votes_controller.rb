class VotesController < ApplicationController
  def new
    @vote = Vote.new
  end

  def create
    @work = Work.find_by(id: params[:work_id])
    @user = User.current

    @vote = Vote.new(work_id: work.id, user_id: user.id)

    is_successful = @vote.save

    if is_successful
      flash[:success] = "Successfully upvoted!"
      redirect_to works_path
    else
      flash[:error] = "You must log in to vote"
      redirect_to works_path
    end

  end
end
