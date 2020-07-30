class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|

      t.string :name                , null:false, length: { maximum: 40}
      t.text   :description_of_item , null:false, length: { maximum: 1000}
      t.string :commodity_condition , null:false
      t.string :shipping_charges	  , null:false
      t.string :days_until_shipping	, null:false
      t.string :price               , null:false, length: { in: 300..9999999}
      t.bigint :prefecture_id

      # 出品中が整数の０、　売れたら１の状態にする
      t.integer :status            ,default: 0
      # t.references :user    , null:false, foreign_key: true
      t.references :category ,type: :bigint , null:false
      t.references :brand            
      t.timestamps
    end
  end
end
