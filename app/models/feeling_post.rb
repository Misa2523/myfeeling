class FeelingPost < ApplicationRecord

  #アソシエーション
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  #バリデーション
  validates :title, presence: true
  validates :body, presence: true

  #引数で渡されたユーザidがFavoriteテーブル内に存在(exists?)するかどうかを調べる
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
