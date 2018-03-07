class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :company
      t.string :recruiter
      t.string :recruiter_email
      t.date :last_contact
      t.string :recruiter_phone
      t.string :recruiter_cell
      t.string :company_website
      t.text :company_address
      t.string :company_contact
      t.string :company_phone
      t.string :position
      t.text :comments
      t.integer :status_id

      t.timestamps
    end
  end
end
