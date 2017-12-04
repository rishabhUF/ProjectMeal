class CreateTrxOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :trx_order_items do |t|
      t.string :name
      t.text :description
      t.decimal :weight_in_grams
      t.decimal :price
      t.decimal :available
      t.integer :quantity
      t.datetime :expiry_date
      t.string :image
      t.belongs_to :org_company
      t.belongs_to :org_product
      t.belongs_to :typ_category
      t.belongs_to :typ_subcategory
      t.belongs_to :trx_order
      t.belongs_to :shipping_address
      t.decimal :net_amount, precision:20, scale: 4
      t.decimal :tax_amount, precision:20, scale: 4
      t.string :description
      t.boolean :delivery_status
      t.timestamps
    end
  end
end
