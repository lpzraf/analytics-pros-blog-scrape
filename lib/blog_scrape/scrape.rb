class BlogScrape::Scrape
  
  def self.scrape_cat_page
    Nokogiri::HTML(open("https://www.analyticspros.com/blog/mobile/react-native-firebase-gtm-integration-installation/"))
  end
  
  def self.scrape_categories
    self.scrape_cat_page.css("li.cat-item")
  end
  
  def self.create_categories
    categories = self.scrape_categories
    
    categories.css("li.cat-item").each do |categ|
      category = BlogScrape::Category.new(
        categ.text, 
        categ.css("a").attribute("href").text
        )
      
    category.save
    end
  end
  
  def self.scrape_category_details(the_category)
    #Nokogiri on the_category.url
  end
  
end