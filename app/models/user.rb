class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one_attached :user_image
  
  def get_uer_image(width, height)
    unless user_image_attached? #画像がなかったら
      #Railsアプリのルートディレクトリから、''へのパスを作成
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      #user_imageに対し、指定されたfile_pathからファイルを開き添付
      user_image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg') #filenameとcontent_typeを指定し、画像のメタデータを設定
    end
    user_image.variant(rerize_to_fill: [width, height]).processed #user_imageを指定された幅と高さにリサイズ
  end
end
