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
end