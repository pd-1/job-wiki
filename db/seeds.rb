# メインのサンプルユーザーを1人作成する
User.create!(name:  "Example User",
  email: "example@test",
  genre_id: 2,
  password:              "foobar",
  password_confirmation: "foobar",
  admin: true)
