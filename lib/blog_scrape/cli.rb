# Our CLI controller: responsible for user interaction

class BlogScrape::CLI
  def call 
    list_categories
    menu
    goodbye
  end
  
  def list_categories
    puts "Welcome to the Analytics Pros blog vault!"
    # puts <<-DOC.gsub /^\s*/,''
    #   1. Advanced Filters
    #   2. AdWords
    #   3. Augmented Analytics
    # DOC
    @categories = BlogScrape::Category.today
  end
  
  def menu
    input = nil
    while input != "exit"
      puts "What would you like to learn today? Enter a category number to get a list of articles, type list to get the categories list again or type exit to finish the program:"
      input = gets.strip.downcase
      case input
      when "1"
        puts "More info on category 1..."
      when "2"
        puts "More info on category 2..."
      when "list"
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