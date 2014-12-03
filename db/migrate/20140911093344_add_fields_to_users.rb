class AddFieldsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :username, :string
    add_column :users, :gender, :string
    add_column :users, :contact, :string
    add_column :users, :address_line1, :string
    add_column :users, :address_line2, :string
  end
end
