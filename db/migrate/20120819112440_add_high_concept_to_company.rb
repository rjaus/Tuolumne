class AddHighConceptToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :high_concept, :text
  end
end
