class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'アクション' },
    { id: 3, name: 'ファンタジー' },
    { id: 4, name: 'ロボット' },
    { id: 5, name: 'スポーツ' },
    { id: 6, name: '恋愛' },
    { id: 7, name: 'コメディ' },
    { id: 8, name: '日常' },
    { id: 9, name: 'ホラー' }
  ]
end
