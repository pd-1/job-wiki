# 職業一覧
none = Category.create(name: "職業を選択してください")
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
medicine_1 = medicine.children.create([{name: "医師"},{name: "看護師"},{name: "薬剤師"},{name: "歯科医師"},{name: "歯科衛生士"},{name: "歯科助手"},{name: "獣医"},{name: "動物看護師"}])
welfare_1 = welfare.children.create([{name: "心理学者"},{name: "理学療法士"}])

# メインのサンプルユーザーを1人作成する
User.create!(name:  "Example User",
  email: "example@test",
  category_id: 17,
  password:              "foobar",
  password_confirmation: "foobar",
  admin: true)

# 職業一覧
none = Category.create(name: "職業を選択してください")
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
medicine_1 = medicine.children.create([{name: "医師"},{name: "看護師"},{name: "薬剤師"},{name: "歯科医師"},{name: "歯科衛生士"},{name: "歯科助手"},{name: "獣医"},{name: "動物看護師"}])
welfare_1 = welfare.children.create([{name: "心理学者"},{name: "理学療法士"}])