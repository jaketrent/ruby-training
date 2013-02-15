class Article < ActiveRecord::Base
  # limit the mass assignment thru Article.create
  attr_accessible :title, :body, :tag_list
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings

  validates :title, :body, presence: true

  def ordered_comments
    comments.order("updated_at desc") if comments
  end

  def tag_list
    tags.map{|tag| tag.name }.join(",")
  end

  def tag_list= value
    new_tags = Array.new
    value.chomp.downcase.split(/, ?/).each do |name|
      new_tags.push Tag.find_or_create_by_name name
    end
    self.tags = new_tags
  end
end
