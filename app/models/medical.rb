class Medical < ActiveHash::Base
  self.data = [
    { id: 1, name: '医師'},
    { id: 2, name: '看護師'},
    { id: 3, name: '薬剤師'},
    { id: 4, name: '歯科医師'},
    { id: 5, name: '歯科衛生士'},
    { id: 6, name: '歯科助手'},
    { id: 7, name: '獣医'},
    { id: 8, name: '動物看護師'}
  ]
end