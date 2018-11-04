class BlogScrape::Category
  attr_accessor :name, :category_url, :post_name, :blog_post_url, :post_description  
  
  @@all = []
  
  def initialize
    @@all << self 
  end

  def self.all
    @@all
  end
  
  def self.scrape_categories
    doc = Nokogiri::HTML(open("https://www.analyticspros.com/blog/mobile/react-native-firebase-gtm-integration-installation/"))
    
    doc.search("li.cat-item").each do |categ|
      category = self.new
      category.name = categ.text
    end
  end
  
  def self.scrape_title
    #how to dynamically change the url whre the blog post are
    doc = Nokogiri::HTML(open("https://www.analyticspros.com/blog/category/advanced-filters/"))
    
    doc.search("h2.entry-title").each do |p_title|
      post_title = self.new
      post_title.post_name = p_title.text
    end
  end
  
  # def blog_post_url
  #   doc = Nokogiri::HTML(open("https://www.analyticspros.com/blog/category/advanced-filters/"))
  #   @blog_post_url = doc.search("h2.entry-title a").attribute("href").text
  #   binding.pry
  #   end
  
  
end