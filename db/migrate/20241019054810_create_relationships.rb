class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|

      ##フォロワーID(フォローするユーザーのID)、フォロードID(フォローされるユーザーのID)を保存するカラム
      t.references :follower, foreign_key: {to_table: :users}
      t.references :follwed, foreign_key: {to_table: :users}

      t.timestamps

      ##２つのカラムの中身が同じ組み合わせでデータ保存するのを防ぐ（同じユーザーを２回フォローできないように設定）
      t.index [:follwer_id, :follwed_id], unique: true
    end
  end
end
