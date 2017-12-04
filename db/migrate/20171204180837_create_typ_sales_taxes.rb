class CreateTypSalesTaxes < ActiveRecord::Migration[5.1]
  def change
    create_table :typ_sales_taxes do |t|
      t.string :name, null: false
      t.belongs_to :typ_region
      t.belongs_to :typ_tax
      t.timestamps
    end
  end
end
