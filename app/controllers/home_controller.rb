class HomeController < ApplicationController
  def index
  end

  def new_guest
    user = User.find_or_create_by(email: 'guest1@example.com') do |user|
        user.password = 'test1234'
        user.name = "ゲストユーザー"
        user.category_id = 17
    end
    sign_in user
    redirect_to jobs_path, notice: 'ゲストユーザーとしてログインしました。'
  end

end
