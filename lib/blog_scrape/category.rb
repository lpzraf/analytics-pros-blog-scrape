class BlogScrape::Category
  
  def self.today
    #should return a bunch of Category
    puts <<-DOC.gsub /^\s*/,''
      1. Advanced Filters
      2. AdWords
      3. Augmented Analytics
    DOC
    category_1 = self.new
    category_1.name = "Advanced Filters"
    category_1.url = "https://www.analyticspros.com/blog/category/advanced-filters/"
  
    category_2 = self.new
    category_2.name = "AdWords"
    category_2.url = "https://www.analyticspros.com/blog/category/adwords/"
    
    category_3 = self.new
    category_3.name = "Augmented Analytics"
    category_3.url = "https://www.analyticspros.com/blog/category/augmented-analytics/"
  
  end
end