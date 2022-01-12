class CreatePostImages < ActiveRecord::Migration[6.1]
  def change
    create_table :post_images do |t|

      t.string :shop_name #お店の名前
      t.text :caption #画像の説明
      t.integer :user_id #投稿したユーザを識別するID(Usersテーブルのidを保存）

      t.timestamps

    end
  end
end
