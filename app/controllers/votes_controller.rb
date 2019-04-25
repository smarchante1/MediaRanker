class VotesController < ApplicationController
  def new
    @vote = Vote.new
  end

  def create
    work = Work.find_by(id: params[:id])
    user = User.find_by(id: session[:user_id])
    vote = Vote.new(vote_date: Date.today, user_id: user.id, work_id: work.id )

    is_successful = vote.save

    if is_successful
      flash[:success] = "Successfully upvoted!"
      redirect_to work_path
    else
      flash[:error] = "You must log in to vote"
      redirect_to work_path
    end
  end
  
  private

  def vote_params
    return params.require(:vote).permit(:id)
  end
end
