class BlogScrape::Category
  attr_accessor :name, :category_url, :post_name, :post_url, :post_description  
  
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
    end
  end
end