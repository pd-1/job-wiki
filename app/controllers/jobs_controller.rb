class JobsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @job = Job.new(params[:id])
  end

  def create
    @job = Job.new(params[:id])
    @job.save
    redirect_to jobs_path
  end
end
