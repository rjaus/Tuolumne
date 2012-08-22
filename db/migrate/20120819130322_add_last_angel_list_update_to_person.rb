class AddLastAngelListUpdateToPerson < ActiveRecord::Migration
  def change
    add_column :people, :last_angel_list_update, :datetime, :default => DateTime.now - 1.year
    add_column :people, :last_website_scrape, :datetime, :default => DateTime.now - 1.year
  end
end
