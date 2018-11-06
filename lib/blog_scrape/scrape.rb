class BlogScrape::Scrape
  
  def self.scrape_cat_page
    Nokogiri::HTML(open("https://www.analyticspros.com/blog/mobile/react-native-firebase-gtm-integration-installation/"))
  end
  
  def self.scrape_categories
    self.scrape_cat_page.css("li.cat-item")
  end
  
  def self.scrape_blog_post(url)
    doc = Nokogiri::HTML(open(url))

    post_name = doc.css("h2.entry-title").text
    post_url = doc.css("h2.entry-title a").attribute("href").text
    post_description = doc.css("h2.entry-title a").attribute("href").text

    blog_post_list = {:post_name => post_name, :post_url => post_url, :post_description => post_description}
    blog_post_list
  end

end