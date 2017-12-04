class CreateTypSubCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :typ_sub_categories do |t|
      t.string :name
      t.references :typ_category

      t.timestamps
    end
  end
end
