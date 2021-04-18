class HomeController < ApplicationController
  def index
  end

  def new_guest
    user = User.find_by(email: 'guest@example.com') do |user|
    sign_in user
    redirect_to jobs_path
  end

end
