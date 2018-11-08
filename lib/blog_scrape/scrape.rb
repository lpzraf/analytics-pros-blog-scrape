class BlogScrape::Scrape
  
  def self.scrape_cat_page
    Nokogiri::HTML(open("https://www.analyticspros.com/blog/mobile/react-native-firebase-gtm-integration-installation/"))
  end
  
  def self.scrape_categories
    self.scrape_cat_page.css("li.cat-item")
  end
end