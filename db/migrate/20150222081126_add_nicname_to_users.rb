class AddNicnameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nicname, :string
  end
end
