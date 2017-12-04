class CreateTypPositions < ActiveRecord::Migration[5.1]
  def change
    create_table :typ_positions do |t|
      t.string :name, null: false
      t.belongs_to :typ_country
      t.timestamps
    end
  end
end
