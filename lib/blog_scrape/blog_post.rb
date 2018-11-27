class BlogScrape::BlogPost
  attr_accessor :post_name, :post_url, :post_author, :post_description  
  
  @@all = []
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  # def add_post_attributes(blog_post_data)
  #   blog_post_data.each {|key,value| self.send(("#{key}="),value)}
  # end
  
  #method below added as a test...should handle attributes for a single post not all of them
  def add_post_attributes(attributes_hash)
      attributes_hash.each do |attribute, value|
        self.send("#{attribute}=", value)
      end
  end
  
end