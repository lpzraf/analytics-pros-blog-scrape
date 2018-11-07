# Our CLI controller: responsible for user interaction

class BlogScrape::CLI
  def call 
    present_categories
    #BlogScrape::Scrape.scrape_categories
    list_categories
    menu
    goodbye
  end
  
  def present_categories
   BlogScrape::Category.create_categories
  end
  
  def list_categories
    puts ""
    puts "=========================================="
    puts "Welcome to the Analytics Pros blog vault!"
    puts "=========================================="
    puts ""
    puts "What would you like to learn today?\n " 
    @categories = BlogScrape::Category.all
    @categories.each.with_index(1) do |category, i|
      puts "#{i}. #{category.name}"
    end
    puts ""
  end
  
  def menu
    input = nil
    while input != "exit"
      puts ""
      puts "Enter a category number to get a list of articles and their URLs."
      puts ""
      puts "Type 'list' to get the categories again, or 'exit' to finish the program:"
      puts ""
      puts ""
      input = gets.strip.downcase
      
      if input.to_i > 0 && input.to_i <= BlogScrape::Category.all.length
        the_category = BlogScrape::Category.all[input.to_i-1]
        puts ""
        puts "#{the_category.name}"
        puts "Link: " + "#{the_category.url}"
        puts ""
        elsif input == "list"
        list_categories
      else
        puts ""
        puts "Oops! What you typed does not exist, why don't you try 'list' and a new number?"
        puts ""
      end
    end
  end
  
  #its not working
  def print_blog_post(category)
    puts ""
    puts "#{category.post_name}"
    puts ""
    puts "#{category.post_description}"
    puts ""
    puts "Read More: " + "#{category.post_url}"
    puts ""

    more_categories?
  end

  #its not working
  def more_categories?
    puts "To go back to the categories type 'menu' or 'exit' to finish for the day."
    puts "\n"
  end

  def goodbye
    puts ""
    puts "See you next time!"
    puts ""
  end
end