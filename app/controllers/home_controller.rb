class HomeController < ApplicationController
  def index
  end

  def new_guest
    user = User.find_or_create_by(email: 'guest@example.com') do |user|
      user.password = 'SecureRandom.urlsafe_base64'
      user.email = "guest@example.com"
      user.name = "ゲストユーザー"
      user.category_id = 17
    end
    sign_in user
    redirect_to jobs_path, notice: 'ゲストユーザーとしてログインしました。'
  end

end
