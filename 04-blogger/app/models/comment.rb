class Comment < ActiveRecord::Base
  belongs_to :article
  attr_accessible :author, :body, :article_id
end
