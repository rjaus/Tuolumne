class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :angellist_id
      t.string :angellist_url
      t.string :logo_url
      t.string :company_url
      t.string :twitter_url
      t.string :blog_url
      t.string :product_desc
      t.string :follower_count

      t.timestamps
    end
  end
end
