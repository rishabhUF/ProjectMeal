class CreateOrgProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :org_products do |t|
      t.string :name, null:false
      t.text :description
      t.decimal :weight_in_grams, null:false
      t.decimal :price, precision: 5, scale: 2, null: false
      t.integer :available_quantity, null: false
      t.datetime :expiry_date, null: false
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.boolean:online_order_available, null: false
      t.float :tax_amoutn, default: 0
      t.string :image

      t.belongs_to :org_company
      t.belongs_to :typ_category
      t.belongs_to :typ_subcategory	
      t.timestamps
    end
  end
end
