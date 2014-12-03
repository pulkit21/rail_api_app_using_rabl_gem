class CreateApplicants < ActiveRecord::Migration
  def change
    create_table :applicants do |t|
      t.string :name
      t.string :email
      t.string :contact
      t.string :resume
      t.references :job, null: false, index: true
      t.timestamps
    end
  end
end
