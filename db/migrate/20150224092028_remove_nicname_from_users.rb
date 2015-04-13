class RemoveNicnameFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :nicname, :string
  end
end
