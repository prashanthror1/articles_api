# README

Ruby Gems used in the project

#For response pagination
gem 'will_paginate'
gem 'api-pagination'

#For unit testing
gem 'rspec-rails'
gem 'factory_bot_rails'
gem 'shoulda-matchers'
gem 'faker'
gem 'database_cleaner'

Steps to run the application

1) Copy/Download the application folder on to a specific destination in the filesystem
2) bundle install
3) Execute the command `rails db:create`
4) Execute the command `rails db:schema:load`
5) Start the server `rails s`

# Access the api endpoints of articles/comments
# use any http client of your choice
# I had used https://httpie.io/
# brew install httpie

http :3000/articles
http :3000/articles?search=foo
http :3000/articles/:id
http POST :3000/articles
http PUT :3000/articles
http DELETE :3000/articles/:id
http :3000/comments
http :3000/comments?article_id=1  
http :3000/comments/:id
http POST :3000/comments
http PUT :3000/comments
https DELETE :3000/comments/:id
