class BlogScrape::BlogPost
  attr_accessor :post_name, :post_url, :post_author, :post_description  
  
  @@all = []
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  #handle attributes for a single post not all of them
  def add_post_attributes(attributes_hash)
      attributes_hash.each do |attribute, value|
        self.send("#{attribute}=", value)
      end
  end
  
end