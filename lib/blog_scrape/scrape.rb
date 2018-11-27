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
    
    blog_post = doc.css("article.post")
    blog_post.each do |post|
      post_name = post.css("h2.entry-title").text.strip 
      post_url = post.css("a").attribute("href").text.gsub("https://www.","").strip 
      post_author = post.css("p.entry-author").text.gsub("By ","").strip 
      post_description = post.css("div.entry-excerpt").text.strip 
    
      blog_post_data = {
        :post_name => post_name, 
        :post_url => post_url, 
        :post_author => post_author, 
        :post_description => post_description}
      
       blog_post_data
    
     a_post = BlogScrape::BlogPost.new()
     a_post.add_post_attributes(blog_post_data)
     a_post.save
     the_category.blog_posts << a_post
  end
  end
end