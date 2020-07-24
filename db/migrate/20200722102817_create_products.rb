class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|

      t.string :name                , null:false
      t.text   :description_of_item , null:false
      t.string :commodity_condition , null:false
      t.string :shipping_charges	  , null:false
      t.string :days_until_shipping	, null:false
      t.string :price               , null:false

      # t.references :user    , null:false, foreign_key: true
      # t.references :category ,null:false, foreign_key: true
      t.references :brand            , foreign_key: true
      t.timestamps
    end
  end
end
