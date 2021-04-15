class JobsController < ApplicationController
  before_action :authenticate_user!
  def index
    @jobs = Job.all
    @parents = Category.all.order("id ASC").limit(15)
  end

  def show
    @category = Category.find(params[:id])
    @users = User.where(category_id: @category.id)
    @job = Job.where(category_id: @category.id)
  end

  def edit
    @category = Category.find(params[:id])
    if current_user.category_id == @category.id
    @job = Job.find(params[:id])
    else
      redirect_to jobs_path
    end
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to job_path(@job.category_id)
    else
       redirect_to jobs_path
    end
  end

  private

  def job_params
    params.require(:job).permit(:description,:active,:flow,:become,:qualification,:salary,:rewarding,:busy,:correct,:aspiring,:status,:demand,:future)
  end
end
