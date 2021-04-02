class JobsController < ApplicationController
  before_action :find_id, only:[:show,:edit,:update]

  def index
    @jobs = Job.all
    @genres = Genre.all 
  end

  def show
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.create(job_params)
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
    params.require(:job).permit(:name, :content).merge(user_id: current_user.id)
  end

  def find_id
    @job = Job.find(params[:id])
  end
end
