class BlogScrape::Category
  attr_accessor :name, :url 
  
  @@all = []
  
  def initialize(name = nil, url = nil)
    @name = name
    @url = url
  end

  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  # def add_post_attributes(blog_post_data)
  #   blog_post_data.each {|key,value| self.send(("#{key}="),value)}
  # end
  
end