class CompanyPerson < ActiveRecord::Base
  attr_accessible :role, :company_id, :person_id

  belongs_to :company
  belongs_to :person
end
