class BlogScrape::Category
  attr_accessor :name, :url
  def self.today
    #scrape AP's blog and return the categories
    self.scrape_categories
  end
   
   def self.scrape_categories
    #go to AP, find categories, extract properties, instantiate categories
     
     categories = []
     
    # category_1 = self.new
    # category_1.name = "Advanced Filters"
    # category_1.url = "https://www.analyticspros.com/blog/category/advanced-filters/"
  
    # category_2 = self.new
    # category_2.name = "AdWords"
    # category_2.url = "https://www.analyticspros.com/blog/category/adwords/"
    
    # category_3 = self.new
    # category_3.name = "Augmented Analytics"
    # category_3.url = "https://www.analyticspros.com/blog/category/augmented-analytics/"
  
    # [category_1,category_2,category_3]
    categories
  end
end