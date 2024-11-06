class Favorite < ApplicationRecord

  #アソシエーション
  belongs_to :user
  belongs_to :feeling_post

  #バリデーション
  #同じ人が同じ投稿に複数回いいねしないよう制限
  validates :user_id, uniqueness: {scope: :feeling_post_id}
  #uniqueness：validatesメソッドの引数user_idカラムの値がすでにテーブルに保存されている値と重複してないかをチェック
  #scope：user_idとfeeling_post_idのペアに対し、既に同じ値のペアがテーブルに保存されてないか判定

end
