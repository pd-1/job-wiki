class HomeController < ApplicationController
  def index
  end

  def new_guest
    user = User.find_or_create_by(name: 'ゲストユーザー',email: 'guest@example.com',category_id: 17) do |user|
        user.password = 'SecureRandom.urlsafe_base64'
    end
    sign_in user
    redirect_to jobs_path, notice: 'ゲストユーザーとしてログインしました。'
  end

end
