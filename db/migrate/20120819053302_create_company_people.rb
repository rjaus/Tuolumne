class CreateCompanyPeople < ActiveRecord::Migration
  def change
    create_table :company_people do |t|
	  t.references :company, :person
      t.string :role

      t.timestamps
    end
    
    add_index :company_people, [:company_id, :person_id, :role]

  end
end
