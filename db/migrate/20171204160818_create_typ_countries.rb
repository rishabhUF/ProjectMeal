class CreateTypCountries < ActiveRecord::Migration[5.1]
  def change
    create_table :typ_countries do |t|
      t.string :iso
      t.string :iso3
      t.string :country
      t.string :continent
      t.string :cuurency_code
      t.string :currency_name
      t.string :phone_prefix_string
      t.string :postal_code
      t.string :languages
      t.string :geonameid
      t.timestamps
    end
  end
end
