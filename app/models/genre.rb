class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--'},
    # { id: 2, name: '学生'},
    { id: 3, name: '医療系'},
    { id: 4, name: '心理・福祉・リハビリ'},
    { id: 5, name: '美容・ファッション'},
    { id: 6, name: '飲食'},
    { id: 7, name: '販売'},
    { id: 8, name: '教育・研究・保育'},
    { id: 9, name: '自然・動物'},
    { id: 10, name: '出版・報道'},
    { id: 11, name: 'テレビ・映画'},
    { id: 12, name: '音楽・ラジオ'},
    { id: 13, name: '芸能・ネット'},
    { id: 14, name: 'スポーツ'},
    { id: 15, name: '漫画・アニメ・ゲーム'},
    { id: 16, name: 'デザイン・広告・アート'},
    { id: 17, name: 'IT・Web'},
    { id: 18, name: '公務員'},
    { id: 19, name: '金融・コンサル系'},
    { id: 20, name: '建築・インテリア・不動産'}
  ]
end