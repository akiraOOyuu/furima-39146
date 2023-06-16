class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
   t.string  :title         , null:false
   t.text    :content       , null:false
   t.integer :category_id   , null:false
   t.integer :status_id     , null:false
   t.integer :postage_id    , null:false
   t.integer :prefecture_id , null:false
   t.integer :deli_day_id   , null:false
   t.integer :price         , null:false
   
      t.timestamps
      # 外部キー設定
      t.references :user     , null:false, foreign_key: true
    end
  end
end
