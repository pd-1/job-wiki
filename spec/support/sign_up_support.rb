module SignInSupport
  def sign_up(user)
    visit root_path
    expect(page).to have_content('新規登録')
    visit new_user_registration_path
    fill_in 'user[name]', with: @user.name
    fill_in 'user[email]', with: @user.email
    select "医療系", from: "user[category_id]"
    sleep 0.5
    find("#child_category").select "医師"
    fill_in 'user[password]', with: @user.password
    fill_in 'user[password_confirmation]', with: @user.password_confirmation
    expect {
      find('input[name=commit]').click
    }.to change { User.count }.by(1)
    expect(current_path).to eq(jobs_path)
  end
end
