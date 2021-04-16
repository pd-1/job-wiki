# 職業一覧
student = Category.create(name: "学生")
medicine = Category.create(name: "医療系")
welfare = Category.create(name: "心理・福祉・リハビリ")
fashion = Category.create(name: "美容・ファッション")
eating = Category.create(name: "飲食")
sale = Category.create(name: "販売")
education = Category.create(name: "教育・研究・保育")
animal = Category.create(name: "自然・動物")
publishing = Category.create(name: "出版・報道")
movies = Category.create(name: "テレビ・映画")
music = Category.create(name: "音楽・ラジオ")
sports = Category.create(name: "スポーツ")
game = Category.create(name: "漫画・アニメ・ゲーム")
design = Category.create(name: "デザイン・広告・アート")
web = Category.create(name: "IT・Web")
public_service = Category.create(name: "公務員")
medicine_1 = medicine.children.create([{name: "医師"},{name: "看護師"},{name: "歯科医師"},{name: "歯科衛生士"},{name: "歯科助手"},{name: "薬剤師"},{name: "獣医"},{name: "動物看護師"}])
welfare_1 = welfare.children.create([{name: "心理学者"},{name: "理学療法士"},{name: "介護福祉士"},{name: "介護職員"},{name: "セラピスト"}])
fashion_1 = fashion.children.create([{name: "美容師"},{name: "ネイリスト"},{name: "化粧品メーカー社員"},{name: "スタイリスト"},{name: "ショップ店員"}])
eating_1 = eating.children.create([{name: "栄養士"},{name: "栄養管理士"},{name: "パティシエ"},{name: "調理師"},{name: "食品衛生監視員"}])
sale_1 = sale.children.create([{name: "販売店員"},{name: "ショップ店員"},{name: "ペットショップ店員"}])
education_1 = education.children.create([{name: "保育士"},{name: "幼稚園教諭"},{name: "ベビーシッター"},{name: "小学校教師"},{name: "中学校教師"},{name: "高校教師"},{name: "大学教授"},{name: "塾講師"}])
animal_1 = animal.children.create([{name: "トリマー"},{name: "ドッグトレーナー"},{name: "ブリーダー"},{name: "ペットシッター"},{name: "動物園飼育員"},{name: "調教師"},{name: "ガーデンデザイナー"},{name: "庭師"},{name: "自然保護官"},{name: "農家"}])
publishing_1 = publishing.children.create([{name: "編集者"},{name: "出版社"},{name: "新聞記者"},{name: "カメラマン"},{name: "小説家"},{name: "コピーライター"}])
movies_1 = movies.children.create([{name: "テレビプロデューサー"},{name: "放送作家"},{name: "テレビカメラマン"},{name: "脚本家"},{name: "映画監督"},{name: "映像クリエーター"}])
music_1 = music.children.create([{name: "歌手"},{name: "ミュージシャン"},{name: "作曲家"},{name: "編曲家"},{name: "音響スタッフ"},{name: "ピアニスト"},{name: "ピアノ調律師"}])
sports_1 = sports.children.create([{name: "スポーツインストラクター"},{name: "スポーツトレーナー"},{name: "サッカー選手"},{name: "野球選手"},{name: "ダンサー"},{name: "プロレスラー"},{name: "騎手"}])
game_1= game.children.create([{name: "声優"},{name: "アニメーター"},{name: "イラストレーター"},{name: "漫画家"},{name: "ゲームクリエーター"},{name: "ゲームプログラマー"},{name: "プロゲーマー"}])
design_1 = design.children.create([{name: "芸術家"},{name: "広告宣伝"},{name: "グラフィックデザイナー"},{name: "イラストレーター"},{name: "アートディレクター"},{name: "WEBデザイナー"},{name: "CDデザイナー"}])
web_1 = web.children.create([{name: "プログラマー"},{name: "ITエンジニア"},{name: "AIエンジニア"},{name: "ゲームプログラマー"},{name: "システムエンジニア"},{name: "インフラエンジニア"}])
public_service_1 = public_service.children.create([{name: "国家公務員"},{name: "地方公務員"},{name: "自衛隊"},{name: "警察官"},{name: "地方公務員"},{name: "救急救命士"}])

# メインのサンプルユーザーを1人作成する
Category.all.each do |category|
Job.create!(
  category_id: category.id,
  description: "この仕事の主な内容は〜〜になります。〜〜が必要となるような職種です。",
  active:"未入力です",
  flow:"未入力です",
  become:"未入力です",
  qualification:"未入力です",
  salary:"未入力です",
  rewarding:"未入力です",
  busy:"未入力です",
  correct:"未入力です",
  aspiring:"未入力です",
  status:"未入力です",
  demand:"未入力です",
  future:"未入力です"
)
end
User.create!(name:  "Example User",
  email: "example@test",
  category_id: 1,
  password:              "foobar",
  password_confirmation: "foobar",
  admin: true)
  