class AddItemNameToKabans < ActiveRecord::Migration
  def change
    add_column :kabans, :item_name, :string
  end
end
