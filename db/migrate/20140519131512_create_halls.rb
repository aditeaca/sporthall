class CreateHalls < ActiveRecord::Migration
  def change
    create_table :halls do |t|
      t.text :nume
      t.text :descriere
      t.text :tipul
      t.text :adresa
      t.text :postcode
      t.text :phone
      t.text :email
      t.text :locatie
      t.text :features
      t.text :poza

      t.timestamps
    end
  end
end
