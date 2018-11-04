class BlogScrape::Category
  attr_accessor :name, :category_url, :post_name, :blog_post_url, :post_description  
  
  @@all = []
  
  def initialize(name = nil, url = nil)
    @name = name,
    @url = url
    # @@all << self 
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
        categ.css.text, 
        "https://www.analyticspros.com/blog/mobile/react-native-firebase-gtm-integration-installation/#{categ.css("li.cat-item a").attribute("href").text}")
    category.save
    end
  end
  
  # def self.scrape_categories
  #   doc = Nokogiri::HTML(open("https://www.analyticspros.com/blog/mobile/react-native-firebase-gtm-integration-installation/"))
    
  #   doc.search("li.cat-item").each do |categ|
  #     category = self.new
  #     category.name = categ.text
  #   end
  # end
  
  
  
  def self.scrape_title
    #how to dynamically change the url whre the blog post are?
    doc = Nokogiri::HTML(open("https://www.analyticspros.com/blog/category/advanced-filters/"))
    
    doc.search("h2.entry-title").each do |p_title|
      post_title = self.new
      post_title.post_name = p_title.text
    end
  end
  
  # def self.scrape_category_url
  #   doc = Nokogiri::HTML(open("https://www.analyticspros.com/blog/mobile/react-native-firebase-gtm-integration-installation/"))
    
  #   doc.search("li.cat-item a").attribute("href").each do |categ_url|
  #     cat_url = self.new
  #     cat_url.category_url = categ_url.text
  #     binding.pry
  #   end
  # end
  
  
  # def blog_post_url
  #   doc = Nokogiri::HTML(open("https://www.analyticspros.com/blog/category/advanced-filters/"))
  #   @blog_post_url = doc.search("h2.entry-title a").attribute("href").text
  #   binding.pry
  #   end
  
  
end