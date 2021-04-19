class HomeController < ApplicationController
  def index
  end

  def new_guest1
   if user = User.find_by(email: 'guest@example.com')
      sign_in user
      redirect_to jobs_path
   else
      redirect_to root_path
   end
  end

  def new_guest2
   if user = User.find_by(email: 'guest2@example.com')
      sign_in user
      redirect_to jobs_path
   else
      redirect_to root_path
   end
  end

end
