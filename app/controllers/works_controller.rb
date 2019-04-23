class WorksController < ApplicationController
  def index
    @works = Works.all
  end

  def show 
    @work = Work.find_by(id: params[:id])

    if @work.nil?
      flash[:failure] = "Your search returned no results."
      redirect_to root_path
    end
  end

  def new
    @work = Works.new
  end

  def create
    @work = Works.new(work_params)

    is_successful = @work.save

    if is_successful
      flash[:success] = "#{@work.title} was successfully created."
      redirect_to work_path(@work.id)
    else
      flash.now[:failure] = "Unable to create #{@work.category}"
      @work.errors.messages.each do |field, messages|
        flash.now[field] = messages
      end
      render :new, status: :bad_request
    end
  end

  def edit
    @work = Work.find_by(id: params[:id])

    unless @work
      head :not_found
    end
  end

  def update
    if @work.update(work_params)
      flash[:success] = "Successfully updated #{@work.title}"
      redirect_to work_path(@work.id)
    else
      flash.now[:error] = "Unable to complete your update"
      render(:edit, status: :bad_request)
    end

  end

  def destroy


  end

  private

  def work_params
    return params.require(:work).permit(:category, :title, :creator, :pub_year, :description)
  end
end
