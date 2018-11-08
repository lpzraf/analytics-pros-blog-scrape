class BlogScrape::Category
  attr_accessor :name, :url, :post_name, :post_url, :post_description  
  
  @@all = []
  
  def initialize(name = nil, url = nil)
    @name = name
    @url = url
    # @post_name = post_name
    # @post_url = post_url
    # @post_description = post_description
  end

  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
    
  def self.create_categories
    categories = BlogScrape::Scrape.scrape_categories
    
    categories.css("li.cat-item").each do |categ|
      category = self.new(
        categ.text, 
        categ.css("a").attribute("href").text
        )
      
    category.save
    end
  end
end