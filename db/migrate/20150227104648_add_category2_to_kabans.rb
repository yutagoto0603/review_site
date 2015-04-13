class AddCategory2ToKabans < ActiveRecord::Migration
  def change
    add_column :kabans, :category2, :string
  end
end
