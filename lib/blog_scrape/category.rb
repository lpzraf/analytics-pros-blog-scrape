class BlogScrape::Category
  attr_accessor :name, :url, :blog_posts 
  
  @@all = []
  
  def initialize(name = nil, url = nil)
    @name = name
    @url = url
    @blog_posts = []
  end

  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
end