class CreateFeelingPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :feeling_posts do |t|

      ##ユーザーID、タイトル、投稿内容(本文)を保存するカラム
      t.references :user, null: false, foreign_key: {to_table: :users}
      t.string :title, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
