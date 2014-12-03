class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.string :title
      t.string :description
      t.string :work
      t.references :user, null: false, index: true
      
      t.timestamps
    end
  end
end
