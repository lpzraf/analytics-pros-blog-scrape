class BlogScrape::Category
  attr_accessor :category_name, :category_url, :blog_post_name, :blog_post_url, :blog_post_description  
  def self.today
    #scrape AP's blog and return the categories
    self.scrape_categories
  end
   
   def self.scrape_categories
    #go to AP, find categories, extract properties, instantiate categories
     
     categories = []
     categories << self.scrape_ap_blog
     
     categories
  end
  def self.scrape_ap_blog
    doc = Nokogiri::HTML(open("https://www.analyticspros.com/blog/mobile/react-native-firebase-gtm-integration-installation/"))
    category_name = doc.search("li.cat-item").text
    binding.pry
  end
end