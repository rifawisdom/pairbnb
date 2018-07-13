class RemoveImageFromListings < ActiveRecord::Migration[5.2]
  def change
    remove_column :listings, :image, :string
  end
end
