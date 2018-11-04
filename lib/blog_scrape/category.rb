class BlogScrape::Category
  attr_accessor :name, :category_url, :blog_post_name, :blog_post_url, :blog_post_description  
  
  
  # def self.today
  #   #scrape AP's blog and return the categories
  #   self.scrape_categories
  # end
   
  # def self.scrape_categories
  #   #go to AP, find categories, extract properties, instantiate categories
  #   categories = []
  #   categories << self.scrape_ap_blog_categories
  #   categories
  # end
  
  
  def self.scrape_ap_blog_categories
    doc = Nokogiri::HTML(open("https://www.analyticspros.com/blog/mobile/react-native-firebase-gtm-integration-installation/"))
    
    doc.search("li.cat-item").each do |categ|
      category = self.new
      category.name = categ.text
      category.category_url = categ.text
      #decide what to do w the categories ive created
      
    end
  end
end