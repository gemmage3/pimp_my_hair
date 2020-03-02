class AddLocationDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :zip_code, :string
    add_column :users, :city, :string
    add_column :users, :country, :string
  end
end
