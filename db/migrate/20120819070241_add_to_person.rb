class AddToPerson < ActiveRecord::Migration
	def change

		add_column :people, :aboutme_url, :string
		add_column :people, :github_url, :string
		add_column :people, :dribbble_url, :string
		add_column :people, :behance_url, :string
		add_column :people, :what_ive_built, :string


	end
end
