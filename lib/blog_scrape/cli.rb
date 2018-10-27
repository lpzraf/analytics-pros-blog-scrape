# Our CLI controller: responsible for user interaction

class BlogScrape::CLI
  def call 
    list_categories
    menu
    goodbye
  end
  
  def list_categories
    puts "Welcome to the Analytics Pros blog vault!"
    puts <<-DOC.gsub /^\s*/,''
      1. Advanced Filters
      2. AdWords
      3. Augmented Analytics
    DOC
  end
  
  def menu
    puts "What would you like to learn today? Enter a category number to get a list of articles, or type exit to enter:"
    input = nil
    while input != "exit"
      input = gets.strip.downcase
      case input
      when "1"
        puts "More info on category 1..."
      when "2"
        puts "More info on category 2..."
      end
  end
end

  def goodbye
    "See you next time!"
  end
end