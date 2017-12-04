class CreateOrgContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :org_contacts do |t|
      t.belongs_to :org_comapny
      t.belongs_to :typ_country
      t.belongs_to :typ_region
      t.belongs_to :org_person
      t.belongs_to :typ_contact
      t.string :address1, null: false
      t.string :address2
      t.string :city, null: false
      t.string :postal_code,null: false
      t.string :email,null: false
      t.string :business_number, null: false
      t.string :cell_number

      t.timestamps
    end
  end
end
