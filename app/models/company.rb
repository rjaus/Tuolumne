class Company < ActiveRecord::Base
  attr_accessible :angellist_id, :angellist_url, :blog_url, :company_url, :follower_count, :logo_url, :name, :product_desc, :twitter_url, :high_concept

  nilify_blanks

  has_many :company_person
  has_many :person, :through => :company_person

end
