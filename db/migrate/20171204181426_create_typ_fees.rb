class CreateTypFees < ActiveRecord::Migration[5.1]
  def change
    create_table :typ_fees do |t|
      t.string :name
      t.float :fee_percentage

      t.timestamps
    end
  end
end
