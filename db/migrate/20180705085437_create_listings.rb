class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
    t.string :type
    t.string :Area
    t.string :description
    t.integer :guess_number
    t.integer :room_number
    t.integer :bath_number
    t.integer :price_per_night
    t.belongs_to :user

      t.timestamps
    end
  end
end
