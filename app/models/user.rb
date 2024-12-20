class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_validation :normalize_email #privateで定義

  #アソシエーション
  has_many :feeling_posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  ##フォローするユーザーから見た中間テーブル（ユーザーがフォローしている他のユーザーとの関係を示す関連付け）
  has_many :active_relationships, class_name: "Relationship",   #class_name：別のモデルに基づいていることを示す
                                  foreign_key: "follower_id",   #foreign_key：別のモデルでのカラムを通じて結びついていることを示す（このユーザーがフォローしている他ユーザーのIDがfollower_idに格納される）
                                  dependent: :destroy
  ##フォローされているユーザーから見た中間テーブル（このユーザーがフォローされている関係を示す）
  has_many :passive_relationships, class_name: "Relationship",
                                  foreign_key: "followed_id",   #このユーザーのIDがfollowed_idに格納される
                                  dependent: :destroy
  ##中間テーブルactive_relationshipsを通りフォローされる側(followed)を集める処理をfollowingsとする
  ##フォローしてるユーザーの情報が分かるようになる
  has_many :followings, through: :active_relationships, source: :followed   #source：active_relationshipsで関連付けられたfollowed(フォローされているユーザー)を指定
  ##中間テーブルpassive_relationshipsを通りフォローする側(follower)を集める処理をfollowersとする
  ##フォローされているユーザーの情報が分かるようになる
  has_many :followers, through: :passive_relationships, source: :follower

  has_one_attached :user_image

  #バリデーション
  validates :name, presence: true # presence：必須項目を示す
  validates :name_kana, presence: true
  validates :telephone_number, presence: true
  validates :birthday, presence: true
  validates :email, presence: true, uniqueness: true, # uniqueness：一意性を示す
            format: {with: URI::MailTo::EMAIL_REGEXP} # メールアドレスが正しいフォーマットであることを

  def get_user_image(width, height)
    unless user_image.attached? #画像がなかったら
      #Railsアプリのルートディレクトリから、''へのパスを作成
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      #user_imageに対し、指定されたfile_pathからファイルを開き添付
      user_image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg') #filenameとcontent_typeを指定し、画像のメタデータを設定
    end
    user_image.variant(resize_to_fill: [width, height]).processed #user_imageを指定された幅と高さにリサイズ
  end

  #ユーザーが認証可能かどうかを判断するメソッド
  def active_for_authentication?
    super && (self.is_active == true)
    #superは親クラス(今回はdeviseのモジュール)の同名メソッドを呼び出す
    #self.is_activeはユーザーオブジェクトのis_active属性を参照
  end

   #誕生日の表示をメソッド化する（表示の時にvuewファイルで呼び出す）
  def birthday_view
    birthday.strftime("%Y年%m月%d日")
  end


  #指定したユーザーをフォローする（active_relationshipsを経由して指定したユーザーをフォロー）
  def follow(user)
    active_relationships.create(followed_id: user.id)
  end

  #指定したユーザーのフォローを解除する
  def unfollow(user)
    active_relationships.find_by(followed_id: user.id).destroy
  end

  #指定したユーザーをフォローしているかどうか判定
  def following?(user)
    followings.include?(user) #真偽値で返す
  end

  private

  #ユーザーが入力したメールアドレスに対する処理をするメソッド
  def normalize_email
    self.email = email.downcase.strip if email.present?
    # downcase：メールアドレスを小文字に変換（同じメールアドレスで大小文字の違いによる重複登録を防ぐ）
    # strip：メールアドレスの前後の空白を削除
    # email.present?：メールアドレスが空でない場合にのみ処理をおこなう
  end

end
