class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,null: false, default: ""
      t.integer :price,null: false
      t.integer :status_id,null: false
      t.integer :post_fee_ad,null: false
      t.integer :area_id,null: false
      t.integer :post_da_id,null: false
      t.integer :category_id,null: false
      t.text    :explanation,null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
