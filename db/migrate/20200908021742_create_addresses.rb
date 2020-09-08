class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer        :arium_id,         null:false
      t.string         :city,             null:false 
      t.string         :house_number,     null:false
      t.string         :tellnumber,       null:false
      t.string         :postnumber,       null:false
      t.string         :building_name
      t.references     :item,             null:false, foreign_key: true
      t.references     :user,             null:false, foreign_key: true

      t.timestamps
    end
  end
end
