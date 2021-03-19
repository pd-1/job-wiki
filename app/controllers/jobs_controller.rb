class JobsController < ApplicationController
  def index
    @jobs = Job.all
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

  private

  def job_params
    params.require(:job).permit(:name, :content).merge(user_id: current_user.id)
  end
end
