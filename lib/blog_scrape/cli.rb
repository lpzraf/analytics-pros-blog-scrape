# The CLI is responsible for user interaction

class BlogScrape::CLI
  def call 
    present_categories
    list_categories
    menu
    goodbye
  end
  
  def present_categories
   BlogScrape::Scrape.create_categories
  end
  
  #method below added as a test
  # def get_post_attributes(blog_post)
  #   blog_post.add_post_attributes
  # end
  
  def list_categories
    puts ""
    puts "=========================================="
    puts "Welcome to the Analytics Pros blog vault!"
    puts "=========================================="
    puts ""
    puts "What would you like to learn today?\n " 
    
    BlogScrape::Category.all.each.with_index(1) do |category, i|
      puts "#{i}. #{category.name}"
    end
    puts ""
  end
  
  def menu
    input = nil
    while input != "exit"
      puts ""
      puts "Enter a category number to get a copy/pastable URL!"
      puts ""
      puts "Type 'list' to get the categories again, or 'exit' to finish the program:"
      puts ""
      puts ""
      input = gets.strip.downcase
      
      if input.to_i > 0 && input.to_i <= BlogScrape::Category.all.length
        the_category = BlogScrape::Category.all[input.to_i-1]
        #now call something like BlogScrape::Scrape.scrape_category_detail(the_category) if it hasn't been scraped yet
        
        # the_blog_post = BlogScrape::Scrape.scrape_category_details(the_category)
        # or 
        # the_blog_post = BlogScrape::BlogPost.add_post_attributes(the_category)
        
        puts ""
        puts "#{the_category.name}"
        puts "Link: " + "#{the_category.url}"
        # puts "#{the_blog_post.post_name}"
        puts ""
      elsif input == "list"
        list_categories
      elsif input == "exit"
        break
      else
        puts ""
        puts "Oops! What you typed does not exist, why don't you try 'list' and a new number?"
        puts ""
      end
    end
  end
  
  #method below added as a test
  # def print_post(blog_post)
  #   puts "#{blog_post.post_name}"
  # end
  
  def goodbye
    puts ""
    puts "See you next time!"
    puts ""
  end
end