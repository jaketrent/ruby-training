class Article < ActiveRecord::Base
  # limit the mass assignment thru Article.create
  attr_accessible :title, :body
end