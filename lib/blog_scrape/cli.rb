# Our CLI controller: responsible for user interaction

class BlogScrape::CLI
  def call 
    list_categories
    menu
    goodbye
  end
  
  # why coding += 1 wont work below?
  def list_categories
    puts "Welcome to the Analytics Pros blog vault!"
    puts "What would you like to learn today?\n " 
    @categories = BlogScrape::Category.today
    @categories.each.with_index(1) do |category, i|
      puts "#{i}. #{category.name}"
    end
    puts ""
  end
  
  def menu
    input = nil
    while input != "exit"
      puts "Enter a category number to get a list of articles. Type list to get the categories list again, or type exit to finish the program:"
      input = gets.strip.downcase
      
      if input.to_i > 0 
        the_category = @categories[input.to_i-1]
        puts "#{the_category.name}"
        elsif input == "list"
        list_categories
      else
        puts "Oops! What you typed does not exist, why don't you try a new number?"
      end
    end
  end

  def goodbye
    puts "See you next time!"
  end
end