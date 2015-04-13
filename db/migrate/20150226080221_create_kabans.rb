class CreateKabans < ActiveRecord::Migration
  def change
    create_table :kabans do |t|
      t.string :category
      t.string :product_name
      t.string :price
      t.text :description
      t.timestamps
    end
  end
end
