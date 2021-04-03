class JobsController < ApplicationController

  def index
    @jobs = Job.all
    @parents = Category.all.order("id ASC").limit(14)
  end

  def show
    @category = Category.find(params[:id])
    @users = User.where(category_id: @category.id)
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.create(job_params)
    redirect_to jobs_path
  end

  def edit
       @children = Category.find(params[:id])
    if Job.where(params[category_id: @children.id]).blank?
       render  :new
    else
      @job = Job.where(params[category_id: @children.id])
      render :edit
    end
  end

  def update
    if @job.update(job_params)
       redirect_to job_path
    else
      redirect_to root_path
    end
  end

  private

  def job_params
    params.require(:job).permit(:category_id,:description,:active,:flow,:become,:qualification,:salary,:rewarding,:busy,:correct,:aspiring,:status,:demand,:future)
  end
end
