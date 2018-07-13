class RemoveGuessNumberFromListings < ActiveRecord::Migration[5.2]
  def change
    remove_column :listings, :guess_number, :integer
  end
end
