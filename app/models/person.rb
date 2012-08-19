class Person < ActiveRecord::Base
  attr_accessible :angellist_url, :bio, :blog_url, :email, :email2, :email3, :facebook_url, :follower_count, :linkedin_url, :name, :online_bio_url, :phone, :twitter_url, :image, :angellist_id, :aboutme_url, :github_url, :behance_url, :dribbble_url, :what_ive_built

  nilify_blanks

  has_many :company_person
  has_many :company, :through => :company_person

end
