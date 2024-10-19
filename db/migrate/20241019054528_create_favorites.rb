class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|

      ##ユーザーID、気持ち投稿IDを保存するカラム
      t.references :user, null: false, foreign_key: {to_table: :users}
      t.references :feeling_post, null: false, foreign_key: {to_table: :feeling_posts}

      t.timestamps
    end
  end
end
