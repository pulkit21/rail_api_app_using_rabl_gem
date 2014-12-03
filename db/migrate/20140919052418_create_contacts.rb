class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.text :content
      t.references :post, null: false, index: true
      t.timestamps
    end
  end
end
