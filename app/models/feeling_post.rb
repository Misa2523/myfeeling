class FeelingPost < ApplicationRecord

  #アソシエーション
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  #バリデーション
  validates :title, presence: true
  validates :body, presence: true

end
