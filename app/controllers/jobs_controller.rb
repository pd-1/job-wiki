class JobsController < ApplicationController
  before_action :find_id, only:[:show,:edit,:update]

  def index
    @jobs = Job.all
    @genres = Genre.all 
    @medicals = Medical.all
  end

  def show

    @category = Category.find(params[:id])
    @users = User.where(category_id: @category.id)
    @job = Job.where(category_id: @category.id)
  end
  
 def new
  @job = Job.new
 end

  def create
    @job = Job.create!(job_params)
    redirect_to jobs_path
  end


  def edit

      @job = Job.find(params[:id])
  end

  def update
    job = Job.update(job_params)
    redirect_to jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:description,:active,:flow,:become,:qualification,:salary,:rewarding,:busy,:correct,:aspiring,:status,:demand,:future).merge(category_id: current_user.category.id)
  end
end
