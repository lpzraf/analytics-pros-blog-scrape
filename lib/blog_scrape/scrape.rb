class BlogScrape::Scrape
  
  def self.get_page
    doc = Nokogiri::HTML(open("https://www.analyticspros.com/blog/mobile/react-native-firebase-gtm-integration-installation/"))
  end
  
  def self.scrape_categories
    self.get_page.css("li.cat-item")
  end

end