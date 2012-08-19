class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.text :bio
      t.string :blog_url
      t.string :online_bio_url
      t.string :twitter_url
      t.string :facebook_url
      t.string :linkedin_url
      t.integer :follower_count
      t.string :angellist_url
      t.string :email
      t.string :phone
      t.string :email2
      t.string :email3

      t.timestamps
    end
  end
end
