class AddAngellistIdToPerson < ActiveRecord::Migration
  def change
    add_column :people, :angellist_id, :integer
  end
end
