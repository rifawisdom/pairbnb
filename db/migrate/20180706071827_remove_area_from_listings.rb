class RemoveAreaFromListings < ActiveRecord::Migration[5.2]
  def change
    remove_column :listings, :Area, :string
  end
end
