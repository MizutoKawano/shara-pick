class CreateRentals < ActiveRecord::Migration[6.0]
  def change
    create_table :rentals do |t|
      t.date           :rental_start,     null:false
      t.date           :rental_end,       null:false
      t.references     :item,             null:false, foreign_key: true
      t.references     :user,             null:false, foreign_key: true


      t.timestamps
    end
  end
end
