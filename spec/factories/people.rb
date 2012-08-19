# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :person do
    name "MyString"
    bio "MyText"
    blog_url "MyString"
    online_bio_url "MyString"
    twitter_url "MyString"
    facebook_url "MyString"
    linkedin_url "MyString"
    follower_count 1
    angellist_url "MyString"
    email "MyString"
    phone "MyString"
    email2 "MyString"
    email3 "MyString"
  end
end
