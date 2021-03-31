class JobGenre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--'},
    { id: 2, name: '医療系'},
    { id: 3, name: '心理・福祉・リハビリ'},
    { id: 4, name: '美容・ファッション'},
    { id: 5, name: '飲食'},
    { id: 6, name: '販売'},
    { id: 7, name: '教育・研究・保育'}
  ]
end