class RenameIndexOnRelationships < ActiveRecord::Migration[6.1]
  def change
    # 古いインデックスを削除
    remove_index :relationships, "index_relationships_on_follwer_id_and_follwed_id"

    # 正しいインデックスを再作成
    add_index :relationships, ["follower_id", "followed_id"], unique: true, name: "index_relationships_on_follower_id_and_followed_id"

  end
end
