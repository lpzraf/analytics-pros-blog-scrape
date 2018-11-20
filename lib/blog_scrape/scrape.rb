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
    doc = Nokogiri::HTML(open(the_category.url))
    
    post_name = doc.css("header.entry-header").text
    post_url = doc.css("a").attribute("href").text
    post_author = doc.css("p.entry-author").text
    post_decsription = doc.css("div.entry-excerpt").text 
    
    blog_post_data = {
       :post_name => post_name, 
       :post_url => post_url, 
       :post_author => post_author, 
       :post_description => post_description}
    
    blog_post_data
  end
end