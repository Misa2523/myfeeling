class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|

      ##ユーザーID、気持ち投稿ID、コメントを保存するカラム
      t.references :user, null: false, foreign_key: {to_table: :users}
      t.references :feeling_post, null: false, foreign_key: {to_table: :feeling_posts}
      t.text :comment, null: false

      t.timestamps
    end
  end
end
