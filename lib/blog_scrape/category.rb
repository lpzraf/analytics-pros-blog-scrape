class BlogScrape::Category
  attr_accessor :name, :category_url, :blog_post_name, :blog_post_url, :blog_post_description  
  
  @@all = []
  
  def initialize
    @@all << self 
  end

  def self.all
    @@all
  end
  
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