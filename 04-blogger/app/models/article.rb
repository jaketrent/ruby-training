class Article < ActiveRecord::Base
  # limit the mass assignment thru Article.create
  attr_accessible :title, :body
  has_many :comments

  def ordered_comments
    comments.order("updated_at desc") if comments
  end
end
