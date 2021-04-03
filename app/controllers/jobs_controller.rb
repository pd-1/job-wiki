class JobsController < ApplicationController
  before_action :find_id, only:[:show,:edit,:update]

  def index
    @jobs = Job.all
    @genres = Genre.all 
    @medicals = Medical.all
  end

  def show
    @users = User.where(genre_id: @job.genre.id)
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.create!(job_params)
    redirect_to jobs_path
  end

  def edit
  end

  def update
    @job.update(job_params)
    redirect_to job_path
  end

  private

  def job_params
    params.require(:job).permit(:name,:genre_id,:description,:active,:flow,:become,:qualification,:salary,:rewarding,:busy,:correct,:aspiring,:status,:demand,:future)
  end

  def find_id
    @job = Job.find(params[:id])
  end
end
